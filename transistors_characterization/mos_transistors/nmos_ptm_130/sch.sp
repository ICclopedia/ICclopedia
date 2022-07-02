* Transistors characterization NMOS transistor netlist

.INCLUDE ../../../device_parameter_libraries/cmos_ptm_asu_130nm_tt.spice

* Circuit Elements: Devices
* dev <nets>        <values>
* --------------------------
*M1    nd ng 0 nb    nmos L=length W=width M=mult
M1    nd ng 0 nb    nmos L=130n W=10u M=1
Vds   nd 0          1.3V
Vgs   ng 0          0.65V
Vbs   nb 0          0V

.END
