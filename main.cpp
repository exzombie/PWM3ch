#include "FastPin.h"
#include <util/delay.h>
#include <avr/interrupt.h>

static const FastAnyPin unconnectedPins[] = {4, 5};

// PWM pins.
static const FastPin<8> red;
static const FastPin<9> green;
static const FastPin<6> blue;

// Analog pins.
static const FastPin<0> lumPot;
static const FastPin<1> redPot;
static const FastPin<2> greenPot;
static const FastPin<3> bluePot; // TODO: set to 3
static const FastAnyPin analogPins[] = {
    lumPot, redPot, greenPot, bluePot
};

static const FastPin<7> colorBtn;
static const FastPin<10> settingSw;

using byte = uint8_t;

// Define the table of colors, which are RGB triplets.
using Color = byte[3];
static const byte nColors = 3;
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

// Set the ADC to free-running mode so that we can take a reading
// anytime without waiting.
// ADC0 is used so do not set MUX bits.
static void freerunADC0()
{
    DIDR0 = _BV(ADC0D); // Disable digital input on ADC0 pin.
    ADCSRA = _BV(ADPS0) | _BV(ADPS1) |_BV(ADPS2); // Max prescaling.
    ADCSRA |= _BV(ADATE); // Auto trigger.
    ADCSRA |= _BV(ADEN); // Enable ADC.
    ADCSRA |= _BV(ADSC); // Start converting.
    ADCSRB |= _BV(ADLAR); // Left-adjust the result for 8-bit read.
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

    freerunADC0();

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
    while (true) {
	_delay_ms(50);
	byte brightness = ADCH;
	for (byte i = 0; i < 3; ++i) {
	    currentColorValue[i] =
		(colors[currentColor][i] * brightness) / 256;
	}
	bool buttonPressed = ! colorBtn.get();
	if (buttonPressed && buttonPrevious) {
	    currentColor = (currentColor + 1) % nColors;
	    buttonPrevious = false;
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

    if (pwmCounter >= currentColorValue[0])
    	red.low();
    if (pwmCounter >= currentColorValue[1])
    	green.low();
    if (pwmCounter >= currentColorValue[2])
    	blue.low();
}
