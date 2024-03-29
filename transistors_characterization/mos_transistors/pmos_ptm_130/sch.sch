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
$Comp
L Sources_Signal:V-IND-DC Vds
U 1 1 5EE7A4AB
P 7250 3500
F 0 "Vds" H 7350 3500 50  0000 L CNN
F 1 "1.3V" H 7353 3455 50  0001 L CNN
F 2 "" H 7000 3500 60  0001 C CNN
F 3 "" H 7000 3500 60  0001 C CNN
	1    7250 3500
	1    0    0    1   
$EndComp
$Comp
L Sources_Signal:V-IND-DC Vgs
U 1 1 5EE624D9
P 6500 3375
F 0 "Vgs" H 6600 3375 50  0000 L CNN
F 1 "1.3V" H 6603 3330 50  0001 L CNN
F 2 "" H 6250 3375 60  0001 C CNN
F 3 "" H 6250 3375 60  0001 C CNN
	1    6500 3375
	-1   0    0    1   
$EndComp
Wire Wire Line
	6850 3250 6850 3400
Text Label 6575 3500 0    50   ~ 0
ng
Text Label 6850 3250 0    50   ~ 0
ns
Wire Wire Line
	7000 3500 6850 3500
Wire Wire Line
	6850 3250 7000 3250
Wire Wire Line
	7250 3400 7250 3250
Text Label 6875 3500 0    50   ~ 0
nb
$Comp
L Sources_Signal:V-IND-DC Vbs
U 1 1 5F0640BF
P 7000 3375
F 0 "Vbs" H 7100 3375 50  0000 L CNN
F 1 "1.3V" H 7103 3330 50  0001 L CNN
F 2 "" H 6750 3375 60  0001 C CNN
F 3 "" H 6750 3375 60  0001 C CNN
	1    7000 3375
	1    0    0    1   
$EndComp
Wire Wire Line
	6700 3500 6500 3500
Wire Wire Line
	6500 3500 6500 3475
Wire Wire Line
	6500 3275 6500 3250
Wire Wire Line
	6500 3250 6850 3250
Connection ~ 6850 3250
Wire Wire Line
	7000 3475 7000 3500
Wire Wire Line
	7000 3275 7000 3250
Connection ~ 7000 3250
Wire Wire Line
	7000 3250 7250 3250
$Comp
L Transistors_MOSFET:PCH-ENH-4TERM-GENERIC M1
U 1 1 5EE6F968
P 6750 3500
F 0 "M1" H 6825 3625 50  0000 R CNN
F 1 "W=10u L=130n" H 7175 3375 50  0001 R CNN
F 2 "" H 6430 4020 60  0001 C CNN
F 3 "" H 6940 3585 60  0001 C CNN
F 4 "d,g,s,b" H 6950 3575 60  0001 L CNN "Spice_Node_Sequence"
	1    6750 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 3750 7250 3600
Text Label 6850 3750 0    60   ~ 0
0
$Comp
L Sources_Power:GND-Earth-REF #PWR1
U 1 1 5F23370C
P 6850 3850
F 0 "#PWR1" H 6825 3675 50  0001 C CNN
F 1 "GND-Earth-REF" H 6850 3750 50  0001 C CNN
F 2 "" H 6850 3850 50  0001 C CNN
F 3 "" H 6850 3850 50  0001 C CNN
	1    6850 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 3600 6850 3750
Connection ~ 6850 3750
Wire Wire Line
	7250 3750 6850 3750
$EndSCHEMATC
