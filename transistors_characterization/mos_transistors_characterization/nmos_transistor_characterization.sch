EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 6850 3750 0    60   ~ 0
0
$Comp
L Transistors_MOSFET:NCH-ENH-4TERM-GENERIC M2
U 1 1 5EE6F968
P 6750 3500
F 0 "M2" H 6975 3500 50  0000 R CNN
F 1 "W=5u L=2u" H 7070 3400 50  0000 R CNN
F 2 "" H 6430 4020 60  0001 C CNN
F 3 "" H 6940 3585 60  0001 C CNN
F 4 "d,g,s,b" H 6950 3575 60  0001 L CNN "Spice_Node_Sequence"
	1    6750 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 3500 6850 3600
$Comp
L Sources_Signal:V-IND-DC V2
U 1 1 5EE7A4AB
P 7150 3500
F 0 "V2" H 7250 3500 50  0000 L CNN
F 1 "1.3V" H 7253 3455 50  0001 L CNN
F 2 "" H 6900 3500 60  0001 C CNN
F 3 "" H 6900 3500 60  0001 C CNN
	1    7150 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 3250 6850 3250
$Comp
L Sources_Power:GND-Earth-REF #PWR?
U 1 1 5EE858DA
P 6850 3950
F 0 "#PWR?" H 6825 3775 50  0001 C CNN
F 1 "GND-Earth-REF" H 6850 3850 50  0001 C CNN
F 2 "" H 6850 3950 50  0001 C CNN
F 3 "" H 6850 3950 50  0001 C CNN
	1    6850 3950
	1    0    0    -1  
$EndComp
$Comp
L Sources_Signal:V-IND-DC V1
U 1 1 5EE624D9
P 6500 3625
F 0 "V1" H 6600 3625 50  0000 L CNN
F 1 "1.3V" H 6603 3580 50  0001 L CNN
F 2 "" H 6250 3625 60  0001 C CNN
F 3 "" H 6250 3625 60  0001 C CNN
	1    6500 3625
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6500 3725 6500 3750
Wire Wire Line
	6500 3750 6850 3750
Wire Wire Line
	7150 3750 6850 3750
Connection ~ 6850 3750
Wire Wire Line
	7150 3750 7150 3600
Wire Wire Line
	6850 3850 6850 3750
Wire Wire Line
	6850 3600 6850 3750
Connection ~ 6850 3600
Wire Wire Line
	6500 3525 6500 3500
Wire Wire Line
	6500 3500 6700 3500
Wire Wire Line
	6850 3250 6850 3400
Wire Wire Line
	7150 3250 7150 3400
Text Label 6600 3500 0    50   ~ 0
n1
Text Label 6950 3250 0    50   ~ 0
n2
$EndSCHEMATC
