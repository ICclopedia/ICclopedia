Four Transistor Modified Wilson BJT Current Mirror Simulation Testbench (DC)

* ---
* Netlist
* ---
.INCLUDE four_transistor_modified_wilson_bjt_current_mirror_npn_simulation_netlist.spice

* ---
* Control (Interactive Interpreter)
* ---
.CONTROL

    $ Make a directory for our output simulation files.
    shell mkdir -p results 
    cd results
    $ Generic prefix for our output files
    set generic_prefix = 'dc'
    
    $ Operating Point analysis
    $ ---
    echo  '* Operating point analysis: Current match '

    OP                      
    print all               

    $ Output current over input current (with constant load"): should be 1 for best match.
    print (v2#branch/v1#branch)

    echo
    echo '*Printing relevant transistor DC parameters table'
    show q.xq1.q1 : ic,ib,ie,vbe,vbc,gm,gpi,go
    show q.xq2.q1 : ic,ib,ie,vbe,vbc,gm,gpi,go
    show q.xq3.q1 : ic,ib,ie,vbe,vbc,gm,gpi,go
    show q.xq4.q1 : ic,ib,ie,vbe,vbc,gm,gpi,go

    $ DC Analysis
    $ ---
    echo '* DC analysis: Voltage dependence of current mirror'

    DC V2 0V 5V 0.1V          ; Sweep Collector voltage from 0v to 5V in 0.1v increments.

    $ Plotting
    $ ---
    $ plotting properties
    $ set our plot scale (i.e. x axis to the n2 vector)
    setscale n2 
    setcs xlabel = 'Collector Voltage (V)'
    setcs ylabel = 'Current Output (uA)'
    set xdel = 0.5
    set yhigh = 51
    set ylow = 49
    set gnuplot_terminal = 'eps'

    setcs title = 'DC Analysis: Collector Current Output vs Collector Voltage' 
    set filename = {$generic_prefix}
    gnuplot $filename (v2#branch*-1e+06) xdelta $xdel title $title xlabel $xlabel ylabel $ylabel 

    setcs title = 'DC Analysis: Collector Current Output vs Collector Voltage (Zoom)' 
    set filename = {$generic_prefix}{'_zoom'}
    gnuplot $filename (v2#branch*-1e+06) ylimit $ylow $yhigh xdelta $xdel title $title xlabel $xlabel ylabel $ylabel 

    $ Write Simulation Data $
    echo '* Writing all simulation data to a textfile'

    set filetype=ascii
    set filename = {$generic_prefix}{'.raw'}
    write $filename

.ENDC
