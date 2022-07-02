Lateral PNP Wilson Current Mirror SPICE Testbench

.INCLUDE wilson_current_mirror_lateral_pnp_simulation_netlist.spice

* Interactive simulation main entry *
.CONTROL

* Make a directory for our output simulation files.
shell mkdir -p results
cd results

* Generic prefix for our output files
set generic_prefix = 'dc'

echo  '* Operating point analysis: Current match '

OP                      
print all               

* Output current over constant input current (with 1V load): should be 1 for best match.
print (v2#branch/50e-06)

echo '* DC analysis: Voltage dependence of current mirror'

DC V2 0V 5V 0.1V          ; Sweep Collector voltage from 0v to 5v in 0.1v increments.

* set our plot scale (i.e. x axis to the n2 vector)
setscale n2 
* plotting properties
setcs xlabel = 'Collector Voltage (V)'
setcs ylabel = 'Current Output (uA)'
set xdel = 0.5
set yhigh = 49
set ylow = 47
set gnuplot_terminal = 'eps'

setcs title = 'DC Analysis: Collector Current Output vs Collector Voltage' 
set filename = {$generic_prefix}
gnuplot $filename (v2#branch*1e+06) xdelta $xdel title $title xlabel $xlabel ylabel $ylabel 

setcs title = 'DC Analysis: Collector Current Output vs Collector Voltage (Zoom)' 
set filename = {$generic_prefix}{'_zoom'}
gnuplot $filename (v2#branch*1e+06) ylimit $ylow $yhigh xdelta $xdel title $title xlabel $xlabel ylabel $ylabel 

echo '* Writing all simulation data to a textfile'

set filetype=ascii
set filename = {$generic_prefix}{'.raw'}
write $filename

.ENDC
