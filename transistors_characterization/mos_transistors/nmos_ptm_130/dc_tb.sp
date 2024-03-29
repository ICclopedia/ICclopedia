Transistors characterization NMOS transistor simulation testbench

*.INCLUDE ./simulation_netlist.spice
.INCLUDE ./sch.sp

* Interactive simulation main entry *
.CONTROL

* Make a directory for our output simulation files and switch to it
shell mkdir -p results 
cd results/
* Generic prefix for our output files
set generic_prefix = 'dc'

echo 
echo '----'
echo 'DC analysis sweep: Large signal DC parameters'
echo '----'
echo 

echo '* Normalized Id vs. Vds for different Vgs bias'
* Choose parameters to save: 
* first DC parameters (needs to be done prior to sims)
* then lumped AC capacitance parameters (to ground)
* then relative AC capacitance parameters among terminals
save all @m1[gm] @m1[gmbs] @m1[gds] @m1[id] @m1[vgs] @m1[vds] @m1[vbs] @m1[vth] @m1[vdsat]
+        @m1[cgg] @m1[cdd] @m1[css] @m1[cbb]
+        @m1[cgs] @m1[cgd] @m1[cgb]
+        @m1[cdg] @m1[cds] @m1[cdb]
+        @m1[csg] @m1[csd] @m1[csb]

set vds_start = 0
set vds_end = 1.3
set vds_increment = 0.05

set vgs_start = 0.1
set vgs_end = 1.3
set vgs_increment = 0.1

DC Vds $vds_start $vds_end $vds_increment Vgs $vgs_start $vgs_end $vgs_increment 

let vds_length=(($vds_end - $vds_start)/$vds_increment)+1
let vgs_length=(($vgs_end - $vgs_start)/$vgs_increment)+1

let vdsat = @m1[vdsat]
reshape vdsat [$&vgs_length][$&vds_length]
let ngvec = ng
reshape ngvec [$&vgs_length][$&vds_length]
let vth = @m1[vth]
reshape vth [$&vgs_length][$&vds_length]

echo 'Vdsat values for each Vgs'
let index = 0
while index < vgs_length
    let vgs_point=ngvec[index][vds_length-1]
    let vdsat_point=vdsat[index][vds_length-1]
    echo "Vgs: At Vgs: $&vgs_point V, Vdsat(@Vds=Vdd): $&vdsat_point"
    let index=index+1
end

* Plotting normalized Ids vs Vgs for different Vgs traces
setscale nd 
setcs xlabel = 'Drain to Source Voltage (V)'
setcs ylabel = 'Normalized Drain Current (mA/um)'
setcs title = 'DC Analysis: Normalized Drain Current vs Drain to Source Voltage' 
set filename = {$generic_prefix}{'_large_signal_id_vds_vgs'}
set gnuplot_terminal = 'eps'
gnuplot $filename (-Vds#branch*1e+03)/(@m1[w]*1e6) title $title xlabel $xlabel ylabel $ylabel 

echo 
echo '* Normalized Id vs. Vgs for different Vbs bias'
set vgs_start = 0.1
set vgs_end = 1.3
set vgs_increment = 0.1

set vbs_start = 0
set vbs_end = -1.3
set vbs_increment = -0.1

DC Vgs $vgs_start $vgs_end $vgs_increment Vbs $vbs_start $vbs_end $vbs_increment 

let vgs_length=(($vgs_end - $vgs_start)/$vgs_increment)+1
let vbs_length=abs(($vbs_end - $vbs_start)/$vbs_increment)+1

let nbvec = nb
reshape nbvec [$&vbs_length][$&vgs_length]
let vth = @m1[vth]
reshape vth [$&vbs_length][$&vgs_length]

echo 'Vth values for each Vbs'
let index = 0
while index < vbs_length
    let vbs_point=nbvec[index][vgs_length-1]
    let vth_point=vth[index][vgs_length-1]
    echo "At Vbs: $&vbs_point V, Vth(@Vgs=Vdd): $&vth_point"
    let index=index+1
end

* Plotting normalized Ids vs Vgs for different Vbs traces
setscale ng 
setcs xlabel = 'Gate to Source Voltage (V)'
setcs ylabel = 'Normalized Drain Current (mA/um)'
setcs title = 'DC Analysis: Normalized Drain Current vs Gate to Source Voltage' 
set filename = {$generic_prefix}{'_large_signal_id_vgs_vbs'}
set gnuplot_terminal = 'eps'
gnuplot $filename (-Vds#branch*1e+03)/(@m1[w]*1e6) title $title xlabel $xlabel ylabel $ylabel 

echo '* Writing DC transfer characteristics data to a textfile'
set filetype=ascii
set filename = {$generic_prefix}{'_large_signal.raw'}
write $filename

echo 
echo '----'
echo 'DC Analysis: small signal transistor parameter sweeps'
echo '----'
echo 

* Plot y vs xscale
set xscale="veff"
echo "* transistor parameters  vs. $xscale (for different Vbs)"

* General plotting properties for postcript printout
* Needed for printing versus arbitrary x-axis (gnuplot does not work)
set hcopydevtype=postscript
set hcopypscolor=1 
set hcopywidth=600
set hcopyheight=400

set vgs_start = 0.05
set vgs_end = 1.3
set vgs_increment = 0.05

set vbs_start = 0
set vbs_end = -1.3
set vbs_increment = -0.1

DC Vgs $vgs_start $vgs_end $vgs_increment Vbs $vbs_start $vbs_end $vbs_increment 

let vgs_length=(($vgs_end - $vgs_start)/$vgs_increment)+1
let vbs_length=abs(($vbs_end - $vbs_start)/$vbs_increment)+1

* Gather main device parameters
let vth=@m1[vth][vgs_length-1]
echo "Vth: $&vth V"

* Calculate important design parameters afterwards
let veff=ng-@m1[vth]
let gmid=@m1[gm]/@m1[id]
let gmw_um=@m1[gm]/(@m1[w]*@m1[m]*1e6)   $ in um
let ao=@m1[gm]/@m1[gds] 
let db20ao=20*log10(abs(ao))                    $ in dB

* Note these approximations only work in active-sat
let ft=@m1[gm]/(2*pi*abs(@m1[cgg]))
let logft=log10(abs(ft))
let fc=1/(2*pi*(1/@m1[gds])*((abs(@m1[cdg]))+(abs(@m1[cds]))+(abs(@m1[cdb]))))
let logfc=log10(abs(fc))
let fom=gmid*ft
let logfom=log(abs(fom))

setscale $xscale
foreach parameter gmid gmw_um db20ao logft logfom
    echo
    echo "Plotting $parameter vs $xscale"
    setcs xlabel = "$xscale"
    setcs ylabel = "$parameter"
    setcs title = "$parameter vs. $xscale"
    set filename = "{$generic_prefix}{_small_signal}_{$parameter}_{vbs}"
    plot dc3.$parameter
    hardcopy $filename{.ps} dc3.$parameter
    +    title $title xlabel $xlabel ylabel $ylabel 
end

echo 
echo "* Transistor parameters  vs. $xscale (for different lengths)"

*set vgs_start = 0.05
*set vgs_end = 1.3
*set vgs_increment = 0.05

set vgs_start = 0.5
set vgs_end = 0.6
set vgs_increment = 0.05

* For each transistor length, sweep:
*   - vgs from 0.05 to 1.3V in 0.05v
* foreach m_l $&m_lsize
foreach m_l 130n 180n 250n 350n 500n 700n 1u 1.5u 2u 3u
    alter @M1[L] = $m_l
    DC Vgs $vgs_start $vgs_end $vgs_increment 

    let vgs_length=(($vgs_end - $vgs_start)/$vgs_increment)+1

    $ Gather main device parameters
    let vth=@m1[vth][vgs_length-1]
    echo "Vth: $&vth V"

    $ Calculate important design parameters afterwards
    let veff=ng-@m1[vth]
    let gmid=@m1[gm]/@m1[id]
    let ro=1/@m1[gds]
    let ao=@m1[gm]/@m1[gds] 
    let db20ao=20*log10(ao)  $ in dB

    $ Note these approximations only work in active-sat
    $ put in log form 
    let ft=@m1[gm]/(2*pi*abs(@m1[cgg]))
    let logft=log10(ft)
    let fc=1/(2*pi*(1/@m1[gds])*((abs(@m1[cdg]))+(abs(@m1[cds]))+(abs(@m1[cdb]))))
    let logfc=log10(fc)
    let fom=gmid*ft
    let logfom=log10(fom)
    $ Update secscale for the current plot

    setscale $xscale
end

foreach parameter gmid ro db20ao logft logfom
    echo "Plotting $parameter vs $xscale"
    setcs xlabel = "$xscale"
    setcs ylabel = "$parameter"
    setcs title = "$parameter vs. $xscale"
    set filename = "{$generic_prefix}{_small_signal}_{$parameter}_{length}"
    echo $filename
    set multiple_plots="dc4.$parameter dc5.$parameter dc6.$parameter dc7.$parameter dc8.$parameter dc9.$parameter dc10.$parameter dc11.$parameter dc12.$parameter dc13.$parameter"
    plot $multiple_plots 
    hardcopy $filename{.ps} $multiple_plots 
    +    title $title xlabel $xlabel ylabel $ylabel 
end

echo '* Writing all simulation data to a textfile'
set filetype=ascii
set filename = {$generic_prefix}{'_small_signal.raw'}
write $filename
* back to main directory
cd ../

.ENDC
