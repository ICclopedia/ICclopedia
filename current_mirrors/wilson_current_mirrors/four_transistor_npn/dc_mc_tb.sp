Four Transistor Modified Wilson BJT Current Mirror Simulation Testbench (Montecarlo)
$ Thoroughly commented for understanding (feel free to remove comments) 

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
    set generic_prefix = 'dc_mc'

    $ To support hard-printouts with ngnutmeg (not required if using gnuplot)
    $ But gnuplot only support plotting 63 vectors.
    set hcopydevtype=postscript
    set hcopypscolor=1

    $ Monte Carlo analysis
    $ ---
    $ Create some global vectors (i.e. in our default const plot)
    $ Monte-Carlo Simulation Properties
    let monte_carlo_runs = 100
    let current_run = 0
    set relative_variation = 0.05
    set sigma = 3

    $ Keep track (i.e. make a copy) of the original parametter set (just use XQ1).
    $ We need to use "global vectors" for this (to keep a copy of the actual value), 
    $ Setting variables keeps a reference instead, which does not work.
    $ Only the major parameters from our bipolar process need to be varied.
    $ As per book reference: Is, Bf and the capacitances (Cje, Cjc and Cjs).
    $ For the provided NPN subcircuit: from model qn1_npn1 (Is, Bf, Cje and Cjc), 
    $ from model dcs_npn1 (Cjo).
    $ Important: you can use the "show" command to display all parsed devices
    $ and models; this is extremely helpful.
    let npn1_qn1_is = @xq1:qn1_npn1[is]
    let npn1_qn1_bf = @xq1:qn1_npn1[bf]
    let npn1_qn1_cje = @xq1:qn1_npn1[cje]
    let npn1_qn1_cjc = @xq1:qn1_npn1[cjc]
    let npn1_dcs_cjo= @xq1:dcs_npn1[cjo]

    $ Create our output plot (collection of vectors which store our simulation data)
    $ first create a new plot and make it the current plot.
    setplot new 
    set curplottitle = 'Monte Carlo Simulation Plot'
    set curplotname = 'monte_carlo'
    $ Store it's reference in a variable so we can switch to it later.
    $ This is the only way to keep track of our plot, changing the name does not work (read bug).
    set monte_carlo_plot = $curplot

    $ define distributions for random numbers:
    $ unif: uniform distribution, deviation relative to nominal value
    $ aunif: uniform distribution, deviation absolute
    $ gauss: Gaussian distribution, deviation relative to nominal value
    $ agauss: Gaussian distribution, deviation absolute
    $ limit: if unif. distributed value >=0 then add +avar to nom, else -avar
    define unif(nom, rvar) (nom + (nom*rvar) * sunif(0))
    define aunif(nom, avar) (nom + avar * sunif(0))
    define gauss(nom, rvar, sig) (nom + (nom*rvar)/sig * sgauss(0))
    define agauss(nom, avar, sig) (nom + avar/sig * sgauss(0))
    define limit(nom, avar) (nom + ((sgauss(0) >= 0) ? avar : -avar))

    $ Run the simulation loop $
    dowhile current_run < monte_carlo_runs
       
        $ note that run=0 simulates with nominal parameters
        $ We need to alter the parametter of each transistor independently.
        $ We are altering capacitances, but they should not matter much (DC only)
        if current_run > 0
            $ XQ1
            altermod @xq1:qn1_npn1[is] = gauss(npn1_qn1_is, $relative_variation, $sigma)
            altermod @xq1:qn1_npn1[bf] = gauss(npn1_qn1_bf, $relative_variation, $sigma)
            altermod @xq1:qn1_npn1[cje] = gauss(npn1_qn1_cje, $relative_variation, $sigma)
            altermod @xq1:qn1_npn1[cjc] = gauss(npn1_qn1_cjc, $relative_variation, $sigma)
            altermod @xq1:dcs_npn1[cjo] = gauss(npn1_dcs_cjo, $relative_variation, $sigma)
            $ XQ2
            altermod @xq2:qn1_npn1[is] = gauss(npn1_qn1_is, $relative_variation, $sigma)
            altermod @xq2:qn1_npn1[bf] = gauss(npn1_qn1_bf, $relative_variation, $sigma)
            altermod @xq2:qn1_npn1[cje] = gauss(npn1_qn1_cje, $relative_variation, $sigma)
            altermod @xq2:qn1_npn1[cjc] = gauss(npn1_qn1_cjc, $relative_variation, $sigma)
            altermod @xq2:dcs_npn1[cjo] = gauss(npn1_dcs_cjo, $relative_variation, $sigma)
            $ XQ3
            altermod @xq3:qn1_npn1[is] = gauss(npn1_qn1_is, $relative_variation, $sigma)
            altermod @xq3:qn1_npn1[bf] = gauss(npn1_qn1_bf, $relative_variation, $sigma)
            altermod @xq3:qn1_npn1[cje] = gauss(npn1_qn1_cje, $relative_variation, $sigma)
            altermod @xq3:qn1_npn1[cjc] = gauss(npn1_qn1_cjc, $relative_variation, $sigma)
            altermod @xq3:dcs_npn1[cjo] = gauss(npn1_dcs_cjo, $relative_variation, $sigma)
            $ XQ4 
            altermod @xq4:qn1_npn1[is] = gauss(npn1_qn1_is, $relative_variation, $sigma)
            altermod @xq4:qn1_npn1[bf] = gauss(npn1_qn1_bf, $relative_variation, $sigma)
            altermod @xq4:qn1_npn1[cje] = gauss(npn1_qn1_cje, $relative_variation, $sigma)
            altermod @xq4:qn1_npn1[cjc] = gauss(npn1_qn1_cjc, $relative_variation, $sigma)
            altermod @xq4:dcs_npn1[cjo] = gauss(npn1_dcs_cjo, $relative_variation, $sigma)
        end

        $ Run our DC analysis with the transistors with modified parameters
        $ This creates a new plot
        DC V2 0V 5V 0.1V          

        $ Store a reference of the current plot (with our simulated data vectors) 
        $ to temp_plot (we are going to switch to our monte_carlo plot)
        set temp_plot = $curplot

        $ Make 'monte_carlo_plot' our current plot, to copy simulated data vectors to it.  
        setplot $monte_carlo_plot  

        $ Create a new output vector to store data from our last simulation (from temp_plot)
        $ Take the vector "current run" (specified by &) and get its value (specified by $) 
        $ We use the "current_run" value to suffix our vector name.
        let output_current{_$&current_run}={$temp_plot}.{v2#branch*-1e+06}
        $ Just to keep track of our voltage scale, this is overwritten every time (we only need one vector for all)
        let voltage_sweep = {$temp_plot}.n2

        $ We copied all the data we needed: Destroy temporary plot vector data, free-up memory.
        destroy $temp_plot

        $ increment our simulation run counter.
        let current_run = current_run + 1
    
    end 
   
    $ Note: At this point our current plot is our monte_carlo_plot 

    $ Plotting
    $ ---
    $ plotting properties
    setscale voltage_sweep 
    setcs title = 'Monte Carlo Analysis (Transistors Mismatch): Current Output vs Collector Voltage'
    setcs xlabel = 'Collector Volage (V)'
    setcs ylabel = 'Current Output (uA)'
    set yhigh = 55
    set ylow = 45
    set gnuplot_terminal = 'eps'

    set filename = {$generic_prefix}
    plot all ylimit $ylow $yhigh title $title xlabel $xlabel ylabel $ylabel 
    hardcopy $filename all ylimit $ylow $yhigh title $title xlabel $xlabel ylabel $ylabel 
    
    $ gnuplot can only do 63 vectors.
    $gnuplot filename all ylimit $ylow $yhigh title $title xlabel $xlabel ylabel $ylabel 
    
    $ Write Simulation Data $
    echo '* Writing all simulation data to a textfile'

    set filetype=ascii
    set filename = {$generic_prefix}{'.raw'}
    write $filename

.ENDC
