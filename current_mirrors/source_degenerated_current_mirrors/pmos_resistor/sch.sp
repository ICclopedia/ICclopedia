* Source Degeneration Resistors Negative Feedback

.INCLUDE ../../../device_parameter_libraries/cmos_ptm_asu_130nm_tt.spice

* Circuit Elements: Devices
* dev <nets>  <values>
* --------------------------
I1 n1 0        50uA		
V1 vp 0        1.3V		
V2 vp n2       0.71005V 
M1 n1 n1 n3 vp pmos w=100u l=3u 
M2 n2 n1 n4 vp pmos w=100u l=3u 
R1 vp n3       3kR
R2 vp n4       3kR

.END
