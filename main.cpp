/*
    PWM3ch, a three-channel PWM LED controller with color presets.
    Copyright (C) 2015 Jure Varlec <jure.varlec@ad-vega.si>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "FastPin.h"
#include <util/delay.h>
#include <avr/interrupt.h>

using byte = uint8_t;
using Color = byte[3];

static const byte debounceMs = 50; // Loop delay.
static const byte nColors = 5;  // The number of color presets.

static const FastAnyPin unconnectedPins[] = {4, 5, 6}; // ICSP, actually.

// PWM pins.
static const FastPin<8> red;
static const FastPin<9> green;
static const FastPin<3> blue;

// Analog pins.
static const FastPin<0> huePot;
static const FastPin<1> satPot;
static const FastPin<2> valPot;

static const FastPin<7> colorBtn;
static const FastPin<10> settingSw;

// The current color as a choice in the EEPROM-stored table.
static byte currentColor = 0;
// The current color in both representations.
static Color currentColorHSV = {0, 0, 0};
static Color currentColorRGB = {0, 0, 0};

static void HSV2RGB()
{
    // Algorithm based on the Wikipedia article on HSV colorspace.
    // Hue is shifted to make potentiometer extremes blue.
    float h_, s, v, c, x, m, r, g, b;
    h_ = (float)(currentColorHSV[0] + 170) * (6. / 256.); // Open interval.
    s = (float)currentColorHSV[1] / 255.;         // Closed interval.
    v = (float)currentColorHSV[2] / 255.;         // Closed interval.
    c = v * s;
    x = c * (1. - fabs(fmodf(h_, 2) - 1.));
    byte choice = floor(h_);
    switch (choice) {
    case 0:
	r = c; g = x; b = 0;
	break;
    case 1:
	r = x; g = c; b = 0;
	break;
    case 2:
	r = 0; g = c; b = x;
	break;
    case 3:
	r = 0; g = x; b = c;
	break;
    case 4:
	r = x; g = 0; b = c;
	break;
    case 5:
	r = c; g = 0; b = x;
	break;
    default:
	r = 0; g = 0; b = 0;
    }
    m = v - c;
    r = 255 * (r + m);
    g = 255 * (g + m);
    b = 255 * (b + m);

    // Use temporaries to reduce glitching to minimum.
    volatile byte rv, gv, bv;
    rv = r; gv = g; bv = b;
    currentColorRGB[0] = rv;
    currentColorRGB[1] = gv;
    currentColorRGB[2] = bv;
}

// Color table access. Only stores hue and saturation.
static void readColor()
{
    EEAR = 2 * currentColor;
    for (byte i = 0; i < 2; ++i) {
	FAST_SET(EECR, EERE);
	currentColorHSV[i] = EEDR;
	++EEAR;
    }
}

static void writeColor()
{
    EECR = 0;
    EEAR = 2 * currentColor;
    for (byte i = 0; i < 2; ++i) {
	EEDR = currentColorHSV[i];
	FAST_SET(EECR, EEMPE);
	FAST_SET(EECR, EEPE);
	while (FAST_GET(EECR, EEPE));
	++EEAR;
    }
}

// Normal mode: measure valPot to adjust brighness, check buttons to
// change colors or enter setting mode.
static void normalLoop();

// Setting mode: measure all pots to fully adjust color, save to
// eeprom.
static void setColorLoop();

static inline byte analogRead(byte pin)
{
    if (pin > 2)
	return 0;
    ADMUX = pin; // Select the pin.
    FAST_SET(ADCSRA, ADSC); // Start converting.
    while (FAST_GET(ADCSRA, ADSC)); // Wait for completion.
    return ADCH;
}

int main()
{
    // Setup pins.
    for (auto& pin: unconnectedPins) {
	pin.input();
	pin.high();
    }
    for_pin([](auto pin) { pin.input(); pin.low(); },
	    huePot, satPot, valPot);
    for_pin([](auto pin) { pin.output(); pin.low(); },
	    red, green, blue);
    for_pin([](auto pin) { pin.input(); pin.high(); },
	    colorBtn, settingSw);

    // Disable digital input on analog pins.
    DIDR0 = _BV(ADC0D) | _BV(ADC1D) | _BV(ADC2D);
    ADCSRA = _BV(ADPS2); // Prescaling 16x.
    ADCSRB |= _BV(ADLAR); // Left-adjust the result for 8-bit read.
    ADCSRA |= _BV(ADEN) | _BV(ADSC); // Enable and initialize the ADC.

    // Set the timer to generate an interrupt every time it wraps. The
    // interrupt will increment the pwmCounter and toggle the LEDs.
    FAST_SET(TIMSK0, TOIE0); // Enable overflow interrupt.
    FAST_SET(TCCR0B, CS00); // Active, no prescaler.

    readColor();
    for (byte i = 0; i < 3; ++i)
	currentColorRGB[i] = 0;
    sei();
    normalLoop();

    return 0;
}

static void normalLoop()
{
    // Debounce variables.
    bool buttonPrevious = false;
    bool switchPrevious = false;

    while (true) {
	_delay_ms(debounceMs);
	// Use the current color preset, but value from pot.
	currentColorHSV[2] = analogRead(valPot);
	HSV2RGB();

	// Read the button and switch and debounce.
	bool buttonPressed = ! colorBtn.get();
	bool switchClosed  = ! settingSw.get();
	if (buttonPressed && buttonPrevious) {
	    // Cycle the color preset.
	    currentColor = (currentColor + 1) % nColors;
	    readColor();
	    buttonPrevious = false;
	} else {
	    buttonPrevious = buttonPressed;
	    if (switchClosed && switchPrevious) {
		// Enter the color setting loop.
		setColorLoop();
		readColor();
	    } else {
		switchPrevious = switchClosed;
	    }
	}
    }
}

static void setColorLoop()
{
    bool buttonPrevious = false; // Debounce.
    while (! settingSw.get()) {
	_delay_ms(debounceMs);
	// Same as the main loop, except the current color is read from pots.
	byte i = 0;
	for_pin([&i](auto pin) { currentColorHSV[i++] = analogRead(pin); },
		huePot, satPot, valPot);
	HSV2RGB();

	// If the button is pressed, overwrite the current color preset.
	bool buttonPressed = ! colorBtn.get();
	if (buttonPressed && buttonPrevious) {
	    writeColor();
	    // Blink write confirmation;
	    for (byte i = 0; i < 5; ++i) {
		_delay_ms(300);
		currentColorHSV[2] = (i%2) * 255;
		HSV2RGB();
	    }
	} else {
	    buttonPrevious = buttonPressed;
	}
    }
}

static byte pwmCounter = 0;

ISR(TIM0_OVF_vect, ISR_BLOCK)
{
    pwmCounter++;

    if (!pwmCounter) {
	for_pin([](auto pin) { pin.high(); }, red, green, blue);
    }

    if (pwmCounter >= currentColorRGB[0])
    	red.low();
    if (pwmCounter >= currentColorRGB[1])
    	green.low();
    if (pwmCounter >= currentColorRGB[2])
    	blue.low();
}
