DC TB

* ---
* Netlist
* ---
.INCLUDE sch.sp

* Interactive simulation main entry *
.CONTROL

$ Make a directory for our output simulation files.
shell mkdir -p results 
cd results/
$ Generic prefix for our output files
set generic_prefix = 'dc'

echo  '* Operating point analysis: Current match '

OP                      
print all               

$ Output current over constant input current (with matched vds load): should be 1 for best match.
print (v2#branch/v1#branch)

echo
echo '*Printing relevant transistor DC parameters table'
show m : gm,gmbs,gds,id,vgs,vds,vbs,vth,vdsat

echo 
echo '*Performing DC analysis sweep: Voltage dependence of current mirror'

DC V2 0V 1.3V 0.05V          ; Sweep Drain voltage from 0v to 1.3v in 0.05v increments.

* Graph properties
setscale n2 ; set our plot scale (i.e. x axis to the n2 vector)
setcs xlabel = 'Drain Voltage (V)'
setcs ylabel = 'Drain Current Output (uA)'
set xdel = 0.10
set xlow = 0
set xhigh = 1.3 
set ylow =48.8
set yhigh = 50.5
set gnuplot_terminal = 'eps'

setcs title = 'DC Analysis: Drain Current Output vs Drain Voltage' 
set filename = {$generic_prefix}
gnuplot $filename (v2#branch*-1e+06) xdelta $xdel title $title xlabel $xlabel ylabel $ylabel 

setcs title = 'DC Analysis: Drain Current Output vs Drain Voltage (Zoom)' 
set filename = {$generic_prefix}{'_zoom'}
gnuplot $filename (v2#branch*-1e+06) ylimit $ylow $yhigh xlimit $xlow $xhigh xdelta $xdel title $title xlabel $xlabel ylabel $ylabel 

echo '* Writing all simulation data to a textfile'

set filetype=ascii
set filename = {$generic_prefix}{'.raw'}
write $filename

cd ..

.ENDC
