
.INCLUDE ../../../device_parameter_libraries/cmos_ptm_asu_130nm_tt.spice


* Netlist: Circuit Elements (Devices)
* dev <nets>        <values>
* -----------------------------------
I1    vp n1      50uA
V1    vp 0       1.3V
V2    n2 0       0.5726419V
M1    n3 n1 0 0  nmos W=12u  L=3u    
M2    n4 n1 0 0  nmos W=12u  L=3u
M3    n2 n1 n4 0 nmos W=80u L=0.130u 
M4    n1 n1 n3 0 nmos W=80u L=0.130u
.end

