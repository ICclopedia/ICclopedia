
.INCLUDE ../../../device_parameter_libraries/cmos_ptm_asu_130nm_tt.spice


* Netlist: Circuit Elements (Devices)
* dev <nets>        <values>
* -----------------------------------
I1    vp n1      50uA
V1    vp 0       1.3V
V2    n2 0       0.65V
M1    n3 n1 0 0  nmos W=20u L=6u
M2    n4 n1 0 0  nmos W=20u L=6u
M3    n2 n1 n4 0 nmos W=200u L=0.35u
M4    n1 n1 n3 0 nmos W=200u L=0.35u
* note m3,m4 require optimization change cascode size to meet performance equal to resistor or diode
* biased
.end

