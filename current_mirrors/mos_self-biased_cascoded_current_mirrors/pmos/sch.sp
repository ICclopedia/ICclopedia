.INCLUDE ../../../device_parameter_libraries/cmos_ptm_asu_130nm_tt.spice

* WORK IN PROGRESS *

* Netlist: Circuit Elements (Devices)
* dev <nets>        <values>
* -----------------------------------
I1    n1 0          50u 
V1    vp 0          1.3V 
V2    vp n2         0.5003101V
M1    n3 n1 vp vp   pmos W=130u L=3u
M2    n4 n1 vp vp   pmos W=130u L=3u
M3    n2 n1 n4 vp   pmos W=800u L=0.130u
M4    n1 n1 n3 vp   pmos W=800u L=0.130u
.end
