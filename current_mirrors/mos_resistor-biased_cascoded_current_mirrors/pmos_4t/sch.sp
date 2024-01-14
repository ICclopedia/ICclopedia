* MOS Current Mirror Nelist

.INCLUDE ../../../device_parameter_libraries/cmos_ptm_asu_130nm_tt.spice

* Netlist: Circuit Elements (Devices)
* dev <nets>        <values>
* -----------------------------------
I1    n3 0          50uA
V1    vp 0          1.3V
V2    vp n2         0.45335V
R1    n1 n3         4kΩ
M1    n4 n1 vp vp   pmos W=220u L=3u
M2    n5 n1 vp vp   pmos W=220u L=3u
M3    n2 n3 n5 vp   pmos W=110u L=0.35u
M4    n1 n3 n4 vp   pmos W=110u L=0.35u

.end
