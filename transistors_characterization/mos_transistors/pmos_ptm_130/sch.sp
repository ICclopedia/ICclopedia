* Transistors characterization PMOS transistor netlist

.INCLUDE ../../../device_parameter_libraries/cmos_ptm_asu_130nm_tt.spice

* Circuit Elements: Devices
* dev <nets>        <values>
* --------------------------
M1    0 ng ns nb    pmos L=130n W=10u M=1
Vds   0 ns          -1.3V
Vgs   ng ns         -0.65V
Vbs   nb ns         0V

.END
