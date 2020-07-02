set terminal X11 noenhanced
set title "DC Analysis: Collector Current Output vs Collector Voltage (Zoom)"
set xlabel "Collector Voltage (V)"
set ylabel "Collector Current Output (uA)"
set grid
unset logscale x 
set xrange [0.000000e+00:5.000000e+00]
unset logscale y 
set yrange [4.790000e+01:5.010000e+01]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'emitter_resistors_negative_feedback_simulation_dc_analysis.data' using 1:2 with lines lw 1 title "(v2#branch*-1e+06)"
set terminal push
set terminal postscript eps color noenhanced
set out 'emitter_resistors_negative_feedback_simulation_dc_analysis.eps'
replot
set term pop
replot
