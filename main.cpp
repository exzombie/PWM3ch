#include "FastPin.h"
#include <util/delay.h>
#include <avr/interrupt.h>

static const FastAnyPin unconnectedPins[] = {4, 5, 6, 7, 9, 10};

static const FastPin<3> green;
static const FastPin<2> red;
static const FastPin<1> blue;

static const FastPin<0> potentiometer; // ADC0 analog input.
static const FastPin<8> button;

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

int main()
{
    // Setup pins.
    for (auto& pin: unconnectedPins) {
	pin.input();
	pin.high();
    }
    for_pin([](auto pin) { pin.output(); pin.low(); },
	    red, green, blue);
    button.input();
    button.high();
    potentiometer.input();
    potentiometer.low();

    // Set the ADC to free-running mode so that we can take a reading
    // anytime without waiting.
    // ADC0 is used so do not set MUX bits.
    DIDR0 = _BV(ADC0D); // Disable digital input on ADC0 pin.
    ADCSRA = _BV(ADPS0) | _BV(ADPS1) |_BV(ADPS2); // Max prescaling.
    ADCSRA |= _BV(ADATE); // Auto trigger.
    ADCSRA |= _BV(ADEN); // Enable ADC.
    ADCSRA |= _BV(ADSC); // Start converting.
    ADCSRB |= _BV(ADLAR); // Left-adjust the result for 8-bit read.

    // Set the timer to generate an interrupt every time it wraps. The
    // interrupt will increment the pwmCounter and toggle the LEDs.
    FAST_SET(TIMSK0, TOIE0); // Enable overflow interrupt.
    FAST_SET(TCCR0B, CS00); // Active, no prescaler.

    sei();

    bool buttonPrevious = false;
    while (true) {
	_delay_ms(50);
	byte brightness = ADCH;
	for (byte i = 0; i < 3; ++i) {
	    currentColorValue[i] =
		(colors[currentColor][i] * brightness) / 256;
	}
	bool buttonPressed = ! button.get();
	if (buttonPressed && buttonPrevious) {
	    currentColor = (currentColor + 1) % nColors;
	    buttonPrevious = false;
	} else {
	    buttonPrevious = buttonPressed;
	}
    }
    return 0;
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
