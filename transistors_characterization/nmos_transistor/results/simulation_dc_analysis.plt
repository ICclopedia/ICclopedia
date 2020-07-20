set terminal X11 noenhanced
set title "DC Analysis: Drain Current Output vs Drain to Source Voltage"
set xlabel "Drain to Source Voltage (V)"
set ylabel "Drain Current (mA)"
set grid
unset logscale x 
set xrange [0.000000e+00:1.300000e+00]
unset logscale y 
set yrange [-4.811701e-01:1.010375e+01]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'simulation_dc_analysis.data' using 1:2 with lines lw 1 title "(-vds#branch*1e+03)"
set terminal push
set terminal postscript eps color noenhanced
set out 'simulation_dc_analysis.eps'
replot
set term pop
replot
