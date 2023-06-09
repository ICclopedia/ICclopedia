
.INCLUDE ../../../device_parameter_libraries/cmos_ptm_asu_130nm_tt.spice

* Netlist: Circuit Elements (Devices)
* dev <nets>      <values>
* -----------------------------------
I1    vp n1       50uA
I2    vp n5       50uA
V1    vp 0        1.3V
V2    n2 0        0.5210616V
M1    n3 n1 0  0  nmos W=20u L=3u
M2    n4 n1 0  0  nmos W=20u L=3u
M3    n2 n5 n4 0  nmos W=10u L=0.35u
M4    n1 n5 n3 0  nmos W=10u L=0.35u
M5    n5 n5 0  0  nmos W=4u L=3u
.end

