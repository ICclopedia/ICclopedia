set terminal X11 noenhanced
set title "DC Analysis: Drain Current Output vs Drain Voltage (Zoom)"
set xlabel "Drain Voltage (V)"
set ylabel "Drain Current Output (uA)"
set grid
unset logscale x 
set xrange [2.000000e-01:1.300000e+00]
unset logscale y 
set yrange [4.570000e+01:5.230000e+01]
set xtics 0.1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'source_degeneration_resistors_negative_feedback_simulation_dc_analysis_zoom.data' using 1:2 with lines lw 1 title "(v2#branch*-1e+06)"
set terminal push
set terminal postscript eps color noenhanced
set out 'source_degeneration_resistors_negative_feedback_simulation_dc_analysis_zoom.eps'
replot
set term pop
replot
