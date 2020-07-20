set terminal X11 noenhanced
set title "DC Analysis: Collector Current Output vs Collector Voltage"
set xlabel "Collector Voltage (V)"
set ylabel "Current Output (uA)"
set grid
unset logscale x 
set xrange [0.000000e+00:5.000000e+00]
unset logscale y 
set yrange [-1.066669e+03:1.016412e+02]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'wilson_current_mirror_lateral_pnp_simulation_dc_analysis_sweep.data' using 1:2 with lines lw 1 title "(v2#branch*1e+06)"
set terminal push
set terminal postscript eps color noenhanced
set out 'wilson_current_mirror_lateral_pnp_simulation_dc_analysis_sweep.eps'
replot
set term pop
replot
