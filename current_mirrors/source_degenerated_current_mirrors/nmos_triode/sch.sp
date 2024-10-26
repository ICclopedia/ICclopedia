* Source Degeneration NMOS-stack Negative Feedback

.INCLUDE ../../../device_parameter_libraries/cmos_ptm_asu_130nm_tt.spice

* Circuit Elements: Devices
* dev <nets>        <values>
* --------------------------
I1    n_pos n1      50uA		
V1    n_pos 0       1.3V		
V2    n2    0       0.8225957V 
M1    n1    n1 n3 0 nmos w=5u l=2u
M_TR1 n3    n1 0  0 nmos w=188n l=130n
M2    n2    n1 n4 0 nmos w=5u l=2u
M_TR2 n4    n1 0  0 nmos w=188n l=130n

.END
