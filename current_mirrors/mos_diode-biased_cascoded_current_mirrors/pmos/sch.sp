.INCLUDE ../../../device_parameter_libraries/cmos_ptm_asu_130nm_tt.spice

* Netlist: Circuit Elements (Devices)
* dev <nets>        <values>
* -----------------------------------
I1    n5 0        50uA
I2    n3 0        50uA
V1    vp 0        1.3V
V2    vp n2       0.65V
M1    n1 n1 vp vp pmos W=100u L=3u
M2    n4 n1 vp vp pmos W=100u L=3u
M3    n2 n3 n4 vp pmos W=50u  L=0.35u
M4    n5 n3 n1 vp pmos W=50u  L=0.35u
M5    n3 n3 vp vp pmos W=11u L=3u
.end
