EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:PWM3ch-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "3 channel PWM LED controller with color presets"
Date "06 sep 2015"
Rev "1"
Comp "Astronomical Society Vega - Ljubljana"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATTINY84-P IC?
U 1 1 55EBFC45
P 2700 3000
F 0 "IC?" H 1850 3750 40  0000 C CNN
F 1 "ATTINY84-P" H 3400 2250 40  0000 C CNN
F 2 "DIP14" H 2700 2800 35  0000 C CIN
F 3 "" H 2700 3000 60  0000 C CNN
	1    2700 3000
	1    0    0    -1  
$EndComp
$Comp
L LM7805 U?
U 1 1 55EBFCD8
P 2250 1100
F 0 "U?" H 2400 904 60  0000 C CNN
F 1 "LM7805" H 2250 1300 60  0000 C CNN
F 2 "" H 2250 1100 60  0000 C CNN
F 3 "" H 2250 1100 60  0000 C CNN
	1    2250 1100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 55EBFD21
P 2250 1350
F 0 "#PWR?" H 2250 1100 50  0001 C CNN
F 1 "GND" H 2250 1200 50  0000 C CNN
F 2 "" H 2250 1350 60  0000 C CNN
F 3 "" H 2250 1350 60  0000 C CNN
	1    2250 1350
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P?
U 1 1 55EC0177
P 1150 1100
F 0 "P?" H 1150 1250 50  0000 C CNN
F 1 "PWR" V 1250 1100 50  0000 C CNN
F 2 "" H 1150 1100 60  0000 C CNN
F 3 "" H 1150 1100 60  0000 C CNN
	1    1150 1100
	-1   0    0    1   
$EndComp
$Comp
L PWR_FLAG #FLG?
U 1 1 55EC01F1
P 1350 1050
F 0 "#FLG?" H 1350 1145 50  0001 C CNN
F 1 "PWR_FLAG" H 1350 1230 50  0000 C CNN
F 2 "" H 1350 1050 60  0000 C CNN
F 3 "" H 1350 1050 60  0000 C CNN
	1    1350 1050
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG?
U 1 1 55EC0211
P 1350 1150
F 0 "#FLG?" H 1350 1245 50  0001 C CNN
F 1 "PWR_FLAG" H 1350 1330 50  0000 C CNN
F 2 "" H 1350 1150 60  0000 C CNN
F 3 "" H 1350 1150 60  0000 C CNN
	1    1350 1150
	-1   0    0    1   
$EndComp
$Comp
L CP1 C?
U 1 1 55EC028F
P 1850 1200
F 0 "C?" H 1875 1300 50  0000 L CNN
F 1 "0.33u" H 1875 1100 50  0000 L CNN
F 2 "" H 1850 1200 60  0000 C CNN
F 3 "" H 1850 1200 60  0000 C CNN
	1    1850 1200
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 55EC02CC
P 2650 1200
F 0 "C?" H 2675 1300 50  0000 L CNN
F 1 "0.1u" H 2675 1100 50  0000 L CNN
F 2 "" H 2650 1200 60  0000 C CNN
F 3 "" H 2650 1200 60  0000 C CNN
	1    2650 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 1150 1650 1150
Wire Wire Line
	1650 1150 1650 1350
Wire Wire Line
	1650 1350 2650 1350
Connection ~ 1850 1350
Connection ~ 2250 1350
Wire Wire Line
	1350 1050 1850 1050
$Comp
L +12V #PWR?
U 1 1 55EC0472
P 1850 1050
F 0 "#PWR?" H 1850 900 50  0001 C CNN
F 1 "+12V" H 1850 1190 50  0000 C CNN
F 2 "" H 1850 1050 60  0000 C CNN
F 3 "" H 1850 1050 60  0000 C CNN
	1    1850 1050
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 55EC0490
P 2650 1050
F 0 "#PWR?" H 2650 900 50  0001 C CNN
F 1 "VCC" H 2650 1200 50  0000 C CNN
F 2 "" H 2650 1050 60  0000 C CNN
F 3 "" H 2650 1050 60  0000 C CNN
	1    2650 1050
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 55EC06E9
P 1650 2400
F 0 "#PWR?" H 1650 2250 50  0001 C CNN
F 1 "VCC" H 1650 2550 50  0000 C CNN
F 2 "" H 1650 2400 60  0000 C CNN
F 3 "" H 1650 2400 60  0000 C CNN
	1    1650 2400
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 55EC0707
P 1650 3600
F 0 "#PWR?" H 1650 3350 50  0001 C CNN
F 1 "GND" H 1650 3450 50  0000 C CNN
F 2 "" H 1650 3600 60  0000 C CNN
F 3 "" H 1650 3600 60  0000 C CNN
	1    1650 3600
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR?
U 1 1 55EC07AB
P 3750 3900
F 0 "#PWR?" H 3750 3750 50  0001 C CNN
F 1 "VCC" H 3750 4050 50  0000 C CNN
F 2 "" H 3750 3900 60  0000 C CNN
F 3 "" H 3750 3900 60  0000 C CNN
	1    3750 3900
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 55EC07C9
P 3750 3750
F 0 "R?" V 3830 3750 50  0000 C CNN
F 1 "10k" V 3750 3750 50  0000 C CNN
F 2 "" V 3680 3750 30  0000 C CNN
F 3 "" H 3750 3750 30  0000 C CNN
	1    3750 3750
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X03 P?
U 1 1 55EC08F4
P 5000 2800
F 0 "P?" H 5150 2550 50  0000 C CNN
F 1 "ICSP" H 5000 2600 50  0000 C CNN
F 2 "" H 5000 1600 60  0000 C CNN
F 3 "" H 5000 1600 60  0000 C CNN
	1    5000 2800
	1    0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 55EC09A8
P 5250 2700
F 0 "#PWR?" H 5250 2450 50  0001 C CNN
F 1 "GND" H 5250 2550 50  0000 C CNN
F 2 "" H 5250 2700 60  0000 C CNN
F 3 "" H 5250 2700 60  0000 C CNN
	1    5250 2700
	0    -1   1    0   
$EndComp
NoConn ~ 5250 2900
$Comp
L BC547 Q?
U 1 1 55EC0B17
P 6950 1600
F 0 "Q?" H 7150 1675 50  0000 L CNN
F 1 "BC547" H 7150 1600 50  0000 L CNN
F 2 "TO-92" H 7150 1525 50  0000 L CIN
F 3 "" H 6950 1600 50  0000 L CNN
	1    6950 1600
	1    0    0    -1  
$EndComp
$Comp
L BUZ11 Q?
U 1 1 55EC0C35
P 7450 2150
F 0 "Q?" H 7700 2225 50  0000 L CNN
F 1 "BUZ80" H 7700 2150 50  0000 L CNN
F 2 "TO-220" H 7700 2075 50  0000 L CIN
F 3 "" H 7450 2150 50  0000 L CNN
	1    7450 2150
	1    0    0    1   
$EndComp
$Comp
L BC547 Q?
U 1 1 55EC0DB4
P 7050 2000
F 0 "Q?" H 7250 2075 50  0000 L CNN
F 1 "BC547" H 7250 2000 50  0000 L CNN
F 2 "TO-92" H 7250 1925 50  0000 L CIN
F 3 "" H 7050 2000 50  0000 L CNN
	1    7050 2000
	0    -1   1    0   
$EndComp
$Comp
L +12V #PWR?
U 1 1 55EC1172
P 6850 2100
F 0 "#PWR?" H 6850 1950 50  0001 C CNN
F 1 "+12V" H 6850 2240 50  0000 C CNN
F 2 "" H 6850 2100 60  0000 C CNN
F 3 "" H 6850 2100 60  0000 C CNN
	1    6850 2100
	0    -1   1    0   
$EndComp
$Comp
L VCC #PWR?
U 1 1 55EC11A8
P 7050 1400
F 0 "#PWR?" H 7050 1250 50  0001 C CNN
F 1 "VCC" H 7050 1550 50  0000 C CNN
F 2 "" H 7050 1400 60  0000 C CNN
F 3 "" H 7050 1400 60  0000 C CNN
	1    7050 1400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 55EC12B5
P 7550 1950
F 0 "#PWR?" H 7550 1700 50  0001 C CNN
F 1 "GND" H 7550 1800 50  0000 C CNN
F 2 "" H 7550 1950 60  0000 C CNN
F 3 "" H 7550 1950 60  0000 C CNN
	1    7550 1950
	1    0    0    1   
$EndComp
$Comp
L R R?
U 1 1 55EC1C9F
P 7250 2450
F 0 "R?" V 7330 2450 50  0000 C CNN
F 1 "1.2k" V 7250 2450 50  0000 C CNN
F 2 "" V 7180 2450 30  0000 C CNN
F 3 "" H 7250 2450 30  0000 C CNN
	1    7250 2450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 55EC1D11
P 7250 2600
F 0 "#PWR?" H 7250 2350 50  0001 C CNN
F 1 "GND" H 7250 2450 50  0000 C CNN
F 2 "" H 7250 2600 60  0000 C CNN
F 3 "" H 7250 2600 60  0000 C CNN
	1    7250 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 2300 7250 2100
$Comp
L BC547 Q?
U 1 1 55EC2732
P 6950 4300
F 0 "Q?" H 7150 4375 50  0000 L CNN
F 1 "BC547" H 7150 4300 50  0000 L CNN
F 2 "TO-92" H 7150 4225 50  0000 L CIN
F 3 "" H 6950 4300 50  0000 L CNN
	1    6950 4300
	1    0    0    -1  
$EndComp
$Comp
L BUZ11 Q?
U 1 1 55EC2738
P 7450 4850
F 0 "Q?" H 7700 4925 50  0000 L CNN
F 1 "BUZ80" H 7700 4850 50  0000 L CNN
F 2 "TO-220" H 7700 4775 50  0000 L CIN
F 3 "" H 7450 4850 50  0000 L CNN
	1    7450 4850
	1    0    0    1   
$EndComp
$Comp
L BC547 Q?
U 1 1 55EC273E
P 7050 4700
F 0 "Q?" H 7250 4775 50  0000 L CNN
F 1 "BC547" H 7250 4700 50  0000 L CNN
F 2 "TO-92" H 7250 4625 50  0000 L CIN
F 3 "" H 7050 4700 50  0000 L CNN
	1    7050 4700
	0    -1   1    0   
$EndComp
$Comp
L +12V #PWR?
U 1 1 55EC2744
P 6850 4800
F 0 "#PWR?" H 6850 4650 50  0001 C CNN
F 1 "+12V" H 6850 4940 50  0000 C CNN
F 2 "" H 6850 4800 60  0000 C CNN
F 3 "" H 6850 4800 60  0000 C CNN
	1    6850 4800
	0    -1   1    0   
$EndComp
$Comp
L VCC #PWR?
U 1 1 55EC274A
P 7050 4100
F 0 "#PWR?" H 7050 3950 50  0001 C CNN
F 1 "VCC" H 7050 4250 50  0000 C CNN
F 2 "" H 7050 4100 60  0000 C CNN
F 3 "" H 7050 4100 60  0000 C CNN
	1    7050 4100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 55EC2750
P 7550 4650
F 0 "#PWR?" H 7550 4400 50  0001 C CNN
F 1 "GND" H 7550 4500 50  0000 C CNN
F 2 "" H 7550 4650 60  0000 C CNN
F 3 "" H 7550 4650 60  0000 C CNN
	1    7550 4650
	1    0    0    1   
$EndComp
$Comp
L R R?
U 1 1 55EC2756
P 7250 5150
F 0 "R?" V 7330 5150 50  0000 C CNN
F 1 "1.2k" V 7250 5150 50  0000 C CNN
F 2 "" V 7180 5150 30  0000 C CNN
F 3 "" H 7250 5150 30  0000 C CNN
	1    7250 5150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 55EC275C
P 7250 5300
F 0 "#PWR?" H 7250 5050 50  0001 C CNN
F 1 "GND" H 7250 5150 50  0000 C CNN
F 2 "" H 7250 5300 60  0000 C CNN
F 3 "" H 7250 5300 60  0000 C CNN
	1    7250 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 5000 7250 4800
$Comp
L BC547 Q?
U 1 1 55EC2833
P 6950 2950
F 0 "Q?" H 7150 3025 50  0000 L CNN
F 1 "BC547" H 7150 2950 50  0000 L CNN
F 2 "TO-92" H 7150 2875 50  0000 L CIN
F 3 "" H 6950 2950 50  0000 L CNN
	1    6950 2950
	1    0    0    -1  
$EndComp
$Comp
L BUZ11 Q?
U 1 1 55EC2839
P 7450 3500
F 0 "Q?" H 7700 3575 50  0000 L CNN
F 1 "BUZ80" H 7700 3500 50  0000 L CNN
F 2 "TO-220" H 7700 3425 50  0000 L CIN
F 3 "" H 7450 3500 50  0000 L CNN
	1    7450 3500
	1    0    0    1   
$EndComp
$Comp
L BC547 Q?
U 1 1 55EC283F
P 7050 3350
F 0 "Q?" H 7250 3425 50  0000 L CNN
F 1 "BC547" H 7250 3350 50  0000 L CNN
F 2 "TO-92" H 7250 3275 50  0000 L CIN
F 3 "" H 7050 3350 50  0000 L CNN
	1    7050 3350
	0    -1   1    0   
$EndComp
$Comp
L +12V #PWR?
U 1 1 55EC2845
P 6850 3450
F 0 "#PWR?" H 6850 3300 50  0001 C CNN
F 1 "+12V" H 6850 3590 50  0000 C CNN
F 2 "" H 6850 3450 60  0000 C CNN
F 3 "" H 6850 3450 60  0000 C CNN
	1    6850 3450
	0    -1   1    0   
$EndComp
$Comp
L VCC #PWR?
U 1 1 55EC284B
P 7050 2750
F 0 "#PWR?" H 7050 2600 50  0001 C CNN
F 1 "VCC" H 7050 2900 50  0000 C CNN
F 2 "" H 7050 2750 60  0000 C CNN
F 3 "" H 7050 2750 60  0000 C CNN
	1    7050 2750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 55EC2851
P 7550 3300
F 0 "#PWR?" H 7550 3050 50  0001 C CNN
F 1 "GND" H 7550 3150 50  0000 C CNN
F 2 "" H 7550 3300 60  0000 C CNN
F 3 "" H 7550 3300 60  0000 C CNN
	1    7550 3300
	1    0    0    1   
$EndComp
$Comp
L R R?
U 1 1 55EC2857
P 7250 3800
F 0 "R?" V 7330 3800 50  0000 C CNN
F 1 "1.2k" V 7250 3800 50  0000 C CNN
F 2 "" V 7180 3800 30  0000 C CNN
F 3 "" H 7250 3800 30  0000 C CNN
	1    7250 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 55EC285D
P 7250 3950
F 0 "#PWR?" H 7250 3700 50  0001 C CNN
F 1 "GND" H 7250 3800 50  0000 C CNN
F 2 "" H 7250 3950 60  0000 C CNN
F 3 "" H 7250 3950 60  0000 C CNN
	1    7250 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 3650 7250 3450
$Comp
L +12V #PWR?
U 1 1 55EC31A2
P 8900 3450
F 0 "#PWR?" H 8900 3300 50  0001 C CNN
F 1 "+12V" H 8900 3590 50  0000 C CNN
F 2 "" H 8900 3450 60  0000 C CNN
F 3 "" H 8900 3450 60  0000 C CNN
	1    8900 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	7550 2350 8300 2350
Wire Wire Line
	8300 2350 8300 3250
Wire Wire Line
	7550 5050 8300 5050
Wire Wire Line
	8300 5050 8300 3650
Wire Wire Line
	7550 3700 8100 3700
Wire Wire Line
	8100 3700 8100 3450
Wire Wire Line
	8100 3450 8500 3450
Wire Wire Line
	3750 3400 6600 3400
Wire Wire Line
	6600 3400 6600 4300
Wire Wire Line
	6600 4300 6750 4300
Wire Wire Line
	3750 3300 6750 3300
Wire Wire Line
	6750 3300 6750 2950
Wire Wire Line
	3750 3000 6600 3000
Wire Wire Line
	6600 3000 6600 1600
Wire Wire Line
	6600 1600 6750 1600
$Comp
L SW_PUSH SW?
U 1 1 55EC366A
P 4150 3150
F 0 "SW?" H 4300 3260 50  0000 C CNN
F 1 "PRESET" H 4150 3070 50  0000 C CNN
F 2 "" H 4150 3150 60  0000 C CNN
F 3 "" H 4150 3150 60  0000 C CNN
	1    4150 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 3100 3850 3100
Wire Wire Line
	3850 3100 3850 3150
$Comp
L GND #PWR?
U 1 1 55EC372C
P 4450 3150
F 0 "#PWR?" H 4450 2900 50  0001 C CNN
F 1 "GND" H 4450 3000 50  0000 C CNN
F 2 "" H 4450 3150 60  0000 C CNN
F 3 "" H 4450 3150 60  0000 C CNN
	1    4450 3150
	0    -1   -1   0   
$EndComp
$Comp
L SPST SW?
U 1 1 55EC38AF
P 4450 3550
F 0 "SW?" H 4450 3650 50  0000 C CNN
F 1 "MODE" H 4450 3450 50  0000 C CNN
F 2 "" H 4450 3550 60  0000 C CNN
F 3 "" H 4450 3550 60  0000 C CNN
	1    4450 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 3500 3950 3500
Wire Wire Line
	3950 3500 3950 3550
$Comp
L GND #PWR?
U 1 1 55EC399F
P 4950 3550
F 0 "#PWR?" H 4950 3300 50  0001 C CNN
F 1 "GND" H 4950 3400 50  0000 C CNN
F 2 "" H 4950 3550 60  0000 C CNN
F 3 "" H 4950 3550 60  0000 C CNN
	1    4950 3550
	0    -1   -1   0   
$EndComp
Text Notes 8100 2200 0    60   ~ 0
TODO: check MOSFET gate pulldown value.
$Comp
L Led_RGB_CA D?
U 1 1 55EC3E5D
P 8700 3450
F 0 "D?" H 8700 3800 50  0000 C CNN
F 1 "Led_RGB_CA" H 8700 3100 50  0000 C CNN
F 2 "" H 8655 3400 50  0000 C CNN
F 3 "" H 8655 3400 50  0000 C CNN
	1    8700 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 3250 8500 3250
Wire Wire Line
	8300 3650 8500 3650
Wire Wire Line
	3750 2900 4750 2900
Wire Wire Line
	3750 2800 4750 2800
Wire Wire Line
	5250 2800 5350 2800
Wire Wire Line
	5350 2800 5350 3000
Connection ~ 5350 3000
Wire Wire Line
	4750 2700 4700 2700
Wire Wire Line
	4700 2700 4700 2750
Wire Wire Line
	4700 2750 3800 2750
Wire Wire Line
	3800 2750 3800 3600
Wire Wire Line
	3800 3600 3750 3600
$Comp
L POT RV?
U 1 1 55EC4BCD
P 4400 1750
F 0 "RV?" H 4400 1650 50  0000 C CNN
F 1 "BRIGHT" H 4400 1750 50  0000 C CNN
F 2 "" H 4400 1750 60  0000 C CNN
F 3 "" H 4400 1750 60  0000 C CNN
	1    4400 1750
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 55EC4D3F
P 4400 2000
F 0 "#PWR?" H 4400 1750 50  0001 C CNN
F 1 "GND" H 4400 1850 50  0000 C CNN
F 2 "" H 4400 2000 60  0000 C CNN
F 3 "" H 4400 2000 60  0000 C CNN
	1    4400 2000
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 55EC4D81
P 4400 1500
F 0 "#PWR?" H 4400 1350 50  0001 C CNN
F 1 "VCC" H 4400 1650 50  0000 C CNN
F 2 "" H 4400 1500 60  0000 C CNN
F 3 "" H 4400 1500 60  0000 C CNN
	1    4400 1500
	1    0    0    -1  
$EndComp
$Comp
L POT RV?
U 1 1 55EC4F0D
P 4800 1750
F 0 "RV?" H 4800 1650 50  0000 C CNN
F 1 "RED" H 4800 1750 50  0000 C CNN
F 2 "" H 4800 1750 60  0000 C CNN
F 3 "" H 4800 1750 60  0000 C CNN
	1    4800 1750
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 55EC4F13
P 4800 2000
F 0 "#PWR?" H 4800 1750 50  0001 C CNN
F 1 "GND" H 4800 1850 50  0000 C CNN
F 2 "" H 4800 2000 60  0000 C CNN
F 3 "" H 4800 2000 60  0000 C CNN
	1    4800 2000
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 55EC4F19
P 4800 1500
F 0 "#PWR?" H 4800 1350 50  0001 C CNN
F 1 "VCC" H 4800 1650 50  0000 C CNN
F 2 "" H 4800 1500 60  0000 C CNN
F 3 "" H 4800 1500 60  0000 C CNN
	1    4800 1500
	1    0    0    -1  
$EndComp
$Comp
L POT RV?
U 1 1 55EC4F6B
P 5200 1750
F 0 "RV?" H 5200 1650 50  0000 C CNN
F 1 "GREEN" H 5200 1750 50  0000 C CNN
F 2 "" H 5200 1750 60  0000 C CNN
F 3 "" H 5200 1750 60  0000 C CNN
	1    5200 1750
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 55EC4F71
P 5200 2000
F 0 "#PWR?" H 5200 1750 50  0001 C CNN
F 1 "GND" H 5200 1850 50  0000 C CNN
F 2 "" H 5200 2000 60  0000 C CNN
F 3 "" H 5200 2000 60  0000 C CNN
	1    5200 2000
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 55EC4F77
P 5200 1500
F 0 "#PWR?" H 5200 1350 50  0001 C CNN
F 1 "VCC" H 5200 1650 50  0000 C CNN
F 2 "" H 5200 1500 60  0000 C CNN
F 3 "" H 5200 1500 60  0000 C CNN
	1    5200 1500
	1    0    0    -1  
$EndComp
$Comp
L POT RV?
U 1 1 55EC4FC3
P 5600 1750
F 0 "RV?" H 5600 1650 50  0000 C CNN
F 1 "BLUE" H 5600 1750 50  0000 C CNN
F 2 "" H 5600 1750 60  0000 C CNN
F 3 "" H 5600 1750 60  0000 C CNN
	1    5600 1750
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 55EC4FC9
P 5600 2000
F 0 "#PWR?" H 5600 1750 50  0001 C CNN
F 1 "GND" H 5600 1850 50  0000 C CNN
F 2 "" H 5600 2000 60  0000 C CNN
F 3 "" H 5600 2000 60  0000 C CNN
	1    5600 2000
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 55EC4FCF
P 5600 1500
F 0 "#PWR?" H 5600 1350 50  0001 C CNN
F 1 "VCC" H 5600 1650 50  0000 C CNN
F 2 "" H 5600 1500 60  0000 C CNN
F 3 "" H 5600 1500 60  0000 C CNN
	1    5600 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 2700 4650 2700
Wire Wire Line
	4650 2700 4650 2450
Wire Wire Line
	4650 2450 5450 2450
Wire Wire Line
	5450 2450 5450 1750
Wire Wire Line
	3750 2600 4600 2600
Wire Wire Line
	4600 2600 4600 2400
Wire Wire Line
	4600 2400 5050 2400
Wire Wire Line
	5050 2400 5050 1750
Wire Wire Line
	4650 1750 4650 2350
Wire Wire Line
	4650 2350 4550 2350
Wire Wire Line
	4550 2350 4550 2500
Wire Wire Line
	4550 2500 3750 2500
Wire Wire Line
	3750 2400 4250 2400
Wire Wire Line
	4250 2400 4250 1750
$EndSCHEMATC