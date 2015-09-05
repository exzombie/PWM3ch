#include "FastPin.h"
#include <util/delay.h>
#include <avr/interrupt.h>

using byte = uint8_t;

static const byte debounceMs = 50;
static const byte nColors = 3;

static const FastAnyPin unconnectedPins[] = {4, 5};

// PWM pins.
static const FastPin<8> red;
static const FastPin<9> green;
static const FastPin<6> blue;

// Analog pins.
static const FastPin<0> lumPot;
static const FastPin<1> redPot;
static const FastPin<2> greenPot;
static const FastPin<3> bluePot;
static const FastAnyPin analogPins[] = {
    lumPot, redPot, greenPot, bluePot
};

static const FastPin<7> colorBtn;
static const FastPin<10> settingSw;

// Define the table of colors, which are RGB triplets.
using Color = byte[3];
static Color colors[nColors] = {
    {255, 255, 255},
    {128, 255, 64},
    {16, 64, 196}
};

// The current color as a choice in the table.
static byte currentColor = 0;
// The current color, dimmed by the potentiometer.
static Color currentColorValue = {0, 0, 0};

// Normal mode: measure lumPot to adjust brighness, check buttons to
// change colors or enter setting mode.
static void normalLoop();

// Setting mode: measure all pots to adjust both color and brightness,
// save to eeprom.
static void setColorLoop();

static inline byte analogRead(byte pin)
{
    if (pin > 3)
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
    for (auto& pin: analogPins) {
	pin.input();
	pin.low();
    }
    for_pin([](auto pin) { pin.output(); pin.low(); },
	    red, green, blue);
    for_pin([](auto pin) { pin.input(); pin.high(); },
	    colorBtn, settingSw);

    // Disable digital input on analog pins.
    DIDR0 = _BV(ADC0D) | _BV(ADC1D) | _BV(ADC2D) | _BV(ADC3D);
    ADCSRA = _BV(ADPS2); // Prescaling 16x.
    ADCSRB |= _BV(ADLAR); // Left-adjust the result for 8-bit read.
    ADCSRA |= _BV(ADEN) | _BV(ADSC); // Enable and initialize the ADC.

    // Set the timer to generate an interrupt every time it wraps. The
    // interrupt will increment the pwmCounter and toggle the LEDs.
    FAST_SET(TIMSK0, TOIE0); // Enable overflow interrupt.
    FAST_SET(TCCR0B, CS00); // Active, no prescaler.

    sei();

    normalLoop();
    return 0;
}

static void normalLoop()
{
    bool buttonPrevious = false;
    bool switchPrevious = false;
    while (true) {
	_delay_ms(debounceMs);
	byte brightness = analogRead(lumPot);
	for (byte i = 0; i < 3; ++i) {
	    currentColorValue[i] =
		(colors[currentColor][i] * brightness) / 256;
	}
	bool buttonPressed = ! colorBtn.get();
	bool switchClosed  = ! settingSw.get();
	if (buttonPressed && buttonPrevious) {
	    currentColor = (currentColor + 1) % nColors;
	    buttonPrevious = false;
	} else {
	    buttonPrevious = buttonPressed;
	    if (switchClosed && switchPrevious) {
		setColorLoop();
	    } else {
		switchPrevious = switchClosed;
	    }
	}
    }
}

static void setColorLoop()
{
    while (! settingSw.get()) {
	_delay_ms(debounceMs);
	byte i = 0;
	for_pin([&i](auto pin) { currentColorValue[i++] = analogRead(pin); },
		redPot, greenPot, bluePot);
	byte brightness = analogRead(lumPot);
	for (byte i = 0; i < 3; ++i) {
	    currentColorValue[i] =
		(currentColorValue[i] * brightness) / 256;
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

    if (pwmCounter >= currentColorValue[0])
    	red.low();
    if (pwmCounter >= currentColorValue[1])
    	green.low();
    if (pwmCounter >= currentColorValue[2])
    	blue.low();
}
