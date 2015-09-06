# PWM3ch

## What is it?

PWM3ch is a three-channel PWM LED controller with color presets. Its interface consists of four potentiometers for controlling the brightness and color, a switch for choosing the operating mode, and a button. In the color preset mode, only the brightness potentiometer is active and the button cycles between a number of saved color presets. In the color setting mode, all potentiometers are active so an arbitrary color can be chosen. The button then saves the new color to EEPROM, so it is stored permanently.

## How to build it?

The schematic for the hardware is in the `circuit` directory. It can be opened using the free [KiCAD](http://kicad-pcb.org/) software. The PCB files will be made available after the design is finalized, but the device can also be built on a protoboard.

The firmware for the ATtiny84 microcontroller can be build simply by typing `make`. It requires avr-gcc-4.9 or later (although at this time, only version 5.2 was tested). This generates the `PWM3ch.hex` file, which can then be uploaded to the microcontroller. The procedure depends on the programmer. An example command is provided in the Makefile and can be executed with `make upload` and `make fuses`. It runs `avrdude` and uses `ArduinoISP` to upload the firmware. The circuit includes an ICSP header so you do not need to remove the chip should you, for example, decide to increse the number of color presets (which BTW is a very simple change in `main.cpp`).

## Authorship and licensing

Authored and maintained by Jure Varlec <jure.varlec@ad-vega.si>.

The whole package is available under the terms of the GNU GPL license, version 3 or later (see the `COPYING` file). However, parts may available under a more permissive license and are marked as such.
