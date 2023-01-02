
.INCLUDE ../../../device_parameter_libraries/cmos_ptm_asu_130nm_tt.spice

* Netlist: Circuit Elements (Devices)
* dev <nets>        <values>
* -----------------------------------
I1    vp n5         50uA
I2    vp n3         50uA
V1    vp 0          1.3V
V2    n2 0          0.65V
M1    n1 n1 0  0    nmos W=20u L=3u
M2    n4 n1 0  0    nmos W=20u L=3u
M3    n2 n3 n4 0    nmos W=10u L=0.35u
M4    n5 n3 n1 0    nmos W=10u L=0.35u
M5    n3 n3 0  0    nmos W=1.4u L=3u
.end

