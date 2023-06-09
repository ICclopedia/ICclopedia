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
Text Label 6000 2400 0    60   ~ 0
n_pos
Text Label 6500 3000 0    60   ~ 0
n1
Text Label 6700 3750 0    60   ~ 0
0
$Comp
L Sources_Power:V-PLUS-SUPPLY #PWR1
U 1 1 5EE601A3
P 5900 2400
F 0 "#PWR1" H 5900 2550 50  0001 C BNN
F 1 "V+" V 5900 2477 50  0000 L CNN
F 2 "" H 5900 2400 60  0001 C CNN
F 3 "" H 5900 2400 60  0001 C CNN
	1    5900 2400
	0    -1   -1   0   
$EndComp
$Comp
L Sources_Signal:I-IND-DC I1
U 1 1 5EE64339
P 6350 2550
F 0 "I1" H 6453 2596 50  0000 L CNN
F 1 "50uA" H 6453 2505 50  0000 L CNN
F 2 "" H 6025 2550 60  0001 C CNN
F 3 "" H 6025 2550 60  0001 C CNN
	1    6350 2550
	1    0    0    -1  
$EndComp
$Comp
L Transistors_MOSFET:NCH-ENH-4TERM-GENERIC M1
U 1 1 5EE6C772
P 6450 3550
F 0 "M1" H 6525 3650 50  0000 R CNN
F 1 "W=20u L=3u" H 6850 3450 50  0000 R CNN
F 2 "" H 6130 4070 60  0001 C CNN
F 3 "" H 6640 3635 60  0001 C CNN
F 4 "d,g,s,b" H 6650 3625 60  0001 L CNN "Spice_Node_Sequence"
	1    6450 3550
	-1   0    0    -1  
$EndComp
$Comp
L Transistors_MOSFET:NCH-ENH-4TERM-GENERIC M2
U 1 1 5EE6F968
P 6850 3550
F 0 "M2" H 6925 3650 50  0000 R CNN
F 1 "W=20u L=3u" H 7150 3450 50  0000 R CNN
F 2 "" H 6530 4070 60  0001 C CNN
F 3 "" H 7040 3635 60  0001 C CNN
F 4 "d,g,s,b" H 7050 3625 60  0001 L CNN "Spice_Node_Sequence"
	1    6850 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 2450 6350 2400
Wire Wire Line
	6350 2400 6000 2400
Connection ~ 6000 2400
$Comp
L Sources_Signal:V-IND-DC V2
U 1 1 5EE7A4AB
P 7350 3400
F 0 "V2" H 7453 3446 50  0000 L CNN
F 1 "0.65V" H 7453 3355 50  0000 L CNN
F 2 "" H 7100 3400 60  0001 C CNN
F 3 "" H 7100 3400 60  0001 C CNN
	1    7350 3400
	1    0    0    -1  
$EndComp
$Comp
L Sources_Power:GND-Earth-REF #PWR2
U 1 1 5EE858DA
P 6700 3950
F 0 "#PWR2" H 6675 3775 50  0001 C CNN
F 1 "GND-Earth-REF" H 6700 3850 50  0001 C CNN
F 2 "" H 6700 3950 50  0001 C CNN
F 3 "" H 6700 3950 50  0001 C CNN
	1    6700 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 3850 6700 3750
$Comp
L RCL:R-AME R1
U 1 1 5EFE6730
P 6350 2850
F 0 "R1" V 6350 2700 50  0000 L CNN
F 1 "10.7kΩ" V 6350 2900 50  0000 L CNN
F 2 "" H 6380 3000 20  0001 C CNN
F 3 "" H 6370 2850 60  0000 C CNN
	1    6350 2850
	0    1    1    0   
$EndComp
Text Label 6250 3550 0    60   ~ 0
0
Wire Wire Line
	6350 3550 6250 3550
Text Label 7000 3550 0    60   ~ 0
0
$Comp
L Sources_Signal:V-IND-DC V1
U 1 1 5EE624D9
P 6000 3000
F 0 "V1" H 6103 3046 50  0000 L CNN
F 1 "1.3V" H 6103 2955 50  0000 L CNN
F 2 "" H 5750 3000 60  0001 C CNN
F 3 "" H 5750 3000 60  0001 C CNN
	1    6000 3000
	-1   0    0    -1  
$EndComp
$Comp
L Transistors_MOSFET:NCH-ENH-4TERM-GENERIC M3
U 1 1 61512FB2
P 6850 3150
F 0 "M3" H 6925 3250 50  0000 R CNN
F 1 "W=10u L=0.35u" H 7300 3050 50  0000 R CNN
F 2 "" H 6530 3670 60  0001 C CNN
F 3 "" H 7040 3235 60  0001 C CNN
F 4 "d,g,s,b" H 7050 3225 60  0001 L CNN "Spice_Node_Sequence"
	1    6850 3150
	1    0    0    -1  
$EndComp
Text Label 7000 3150 0    60   ~ 0
0
Wire Wire Line
	6950 3050 6950 2950
Wire Wire Line
	7350 2950 7350 3300
Wire Wire Line
	6950 3550 7050 3550
Wire Wire Line
	6950 3150 7050 3150
Wire Wire Line
	6700 3750 6950 3750
Wire Wire Line
	6000 3750 6000 3100
Wire Wire Line
	7350 3750 7350 3500
Wire Wire Line
	6950 3650 6950 3750
Connection ~ 6950 3750
Wire Wire Line
	6350 3650 6350 3750
Text Label 6950 2950 0    50   ~ 0
n2
$Comp
L Transistors_MOSFET:NCH-ENH-4TERM-GENERIC M4
U 1 1 6475805A
P 6450 3150
F 0 "M4" H 6525 3250 50  0000 R CNN
F 1 "W=10u L=0.35u" H 6850 3050 50  0000 R CNN
F 2 "" H 6130 3670 60  0001 C CNN
F 3 "" H 6640 3235 60  0001 C CNN
F 4 "d,g,s,b" H 6650 3225 60  0001 L CNN "Spice_Node_Sequence"
	1    6450 3150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6350 3050 6350 3000
Wire Wire Line
	6250 3150 6350 3150
Text Label 6250 3150 0    50   ~ 0
0
Wire Wire Line
	6000 3750 6350 3750
Wire Wire Line
	6350 3450 6350 3250
Wire Wire Line
	6500 3150 6700 3150
Wire Wire Line
	6700 3150 6700 2700
Wire Wire Line
	6700 2700 6350 2700
Wire Wire Line
	6350 2700 6350 2750
Wire Wire Line
	6800 3150 6700 3150
Connection ~ 6700 3150
Wire Wire Line
	6600 3550 6600 3000
Wire Wire Line
	6600 3000 6350 3000
Wire Wire Line
	6500 3550 6600 3550
Connection ~ 6350 3000
Wire Wire Line
	6350 3000 6350 2950
Wire Wire Line
	6950 2950 7350 2950
Wire Wire Line
	6350 3750 6700 3750
Connection ~ 6700 3750
Connection ~ 6600 3550
Wire Wire Line
	6600 3550 6800 3550
Wire Wire Line
	6950 3750 7350 3750
Wire Wire Line
	6950 3450 6950 3250
Text Label 6350 3400 0    50   ~ 0
n4
Text Label 6600 2700 0    50   ~ 0
n3
Text Label 6950 3400 0    50   ~ 0
n5
Wire Wire Line
	6350 2650 6350 2700
Connection ~ 6350 2700
Connection ~ 6350 3750
Wire Wire Line
	6000 2400 6000 2900
$EndSCHEMATC
