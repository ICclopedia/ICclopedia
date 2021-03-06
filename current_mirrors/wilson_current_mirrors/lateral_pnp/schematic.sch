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
L Sources_Power:GND-Earth-REF #PWR2
U 1 1 59B63CAE
P 4900 4100
F 0 "#PWR2" H 4900 3925 50  0001 C CNN
F 1 "GND-Earth-REF" H 4900 4000 50  0001 C CNN
F 2 "" H 4900 4100 50  0001 C CNN
F 3 "" H 4900 4100 50  0001 C CNN
	1    4900 4100
	1    0    0    -1  
$EndComp
$Comp
L Sources_Power:V-PLUS-SUPPLY #PWR1
U 1 1 59B63CC4
P 4400 2800
F 0 "#PWR1" H 4400 2950 50  0001 C BNN
F 1 "V+" H 4400 2875 50  0000 C BNN
F 2 "" H 4400 2800 60  0001 C CNN
F 3 "" H 4400 2800 60  0001 C CNN
	1    4400 2800
	0    -1   -1   0   
$EndComp
$Comp
L Sources_Signal:I-IND-DC I1
U 1 1 59B63CDA
P 4900 3700
F 0 "I1" H 5000 3750 50  0000 L BNN
F 1 "50uA" H 5000 3650 50  0000 L TNN
F 2 "" H 4900 3700 60  0001 C CNN
F 3 "" H 4900 3700 60  0001 C CNN
	1    4900 3700
	1    0    0    -1  
$EndComp
$Comp
L Sources_Signal:V-IND-DC V2
U 1 1 59B63D8F
P 5350 3700
F 0 "V2" H 5450 3750 50  0000 L BNN
F 1 "4V" H 5450 3650 50  0000 L TNN
F 2 "" H 5350 3700 60  0001 C CNN
F 3 "" H 5350 3700 60  0001 C CNN
	1    5350 3700
	1    0    0    -1  
$EndComp
$Comp
L Sources_Signal:V-IND-DC V1
U 1 1 59B63DF1
P 4600 3400
F 0 "V1" H 4500 3450 50  0000 R BNN
F 1 "5V" H 4500 3350 50  0000 R TNN
F 2 "" H 4600 3400 60  0001 C CNN
F 3 "" H 4600 3400 60  0001 C CNN
	1    4600 3400
	1    0    0    -1  
$EndComp
Text Label 4700 2800 0    60   ~ 0
n_pos
Text Label 4900 3900 0    60   ~ 0
0
Text Label 5350 3200 2    60   ~ 0
n1
Text Label 5350 3600 2    60   ~ 0
n2
$Comp
L Transistors_Bipolar_BJT:PNP-SPLIT-COLL-GENERIC Q1
U 1 1 59B64806
P 5200 2900
F 0 "Q1" H 5300 2900 50  0000 C CNN
F 1 "PNP-Split-COLL" H 5100 2950 50  0001 R CNN
F 2 "" H 5350 3000 50  0000 C CNN
F 3 "" H 5150 2900 50  0000 C CNN
F 4 "c1,c2,b,e" H 5250 2900 60  0001 L CNN "Spice_Node_Sequence"
	1    5200 2900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5250 2900 5350 2900
Wire Wire Line
	4900 3400 5200 3400
Connection ~ 4900 3400
Wire Wire Line
	4600 3500 4600 3900
Wire Wire Line
	4600 3900 4900 3900
Wire Wire Line
	5350 3900 5350 3800
Wire Wire Line
	4900 3800 4900 3900
Connection ~ 4900 3900
Wire Wire Line
	5350 3600 5350 3500
Wire Wire Line
	4500 2800 4600 2800
Connection ~ 4600 2800
Wire Wire Line
	4600 2800 4600 3300
Text Label 4900 3400 0    60   ~ 0
n3
$Comp
L Transistors_Bipolar_BJT:PNP-GENERIC Q2
U 1 1 59C324F8
P 5250 3400
F 0 "Q2" H 5350 3475 50  0000 L BNN
F 1 "PNP" H 5350 3325 50  0000 L TNN
F 2 "" H 5400 3500 50  0000 C CNN
F 3 "" H 5200 3400 50  0000 C CNN
F 4 "c,b,e" H 5375 3400 50  0001 L CNN "Spice_Node_Sequence"
	1    5250 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 3400 4900 3600
Wire Wire Line
	4900 3900 5350 3900
Wire Wire Line
	4900 3900 4900 4000
Wire Wire Line
	4600 2800 5100 2800
Wire Wire Line
	4900 2950 5100 2950
Wire Wire Line
	4900 2950 4900 3400
Wire Wire Line
	5350 3200 5350 3300
Wire Wire Line
	5350 2900 5350 3200
Connection ~ 5350 3200
Wire Wire Line
	5100 3000 5100 3200
Wire Wire Line
	5100 3200 5350 3200
$EndSCHEMATC
