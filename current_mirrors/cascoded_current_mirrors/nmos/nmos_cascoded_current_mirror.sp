* MOS Current Mirror with Cascode Stage Simulation Netlist

.INCLUDE ../../../device_parameter_libraries/cmos_ptm_asu_130nm_tt.spice

* Netlist: Circuit Elements (Devices)
* dev <nets>        <values>
* -----------------------------------
I1    n_pos n3      50uA
V1    n_pos 0       1.3V
V2    n2    0       0.65V
R1    n3    n1      10.7kΩ
M1    n1    n1 0  0 nmos W=20u L=3u
M2    n4    n1 0  0 nmos W=20u L=3u
M3    n2 n3 n4 0    nmos W=10u L=0.35u
.end
