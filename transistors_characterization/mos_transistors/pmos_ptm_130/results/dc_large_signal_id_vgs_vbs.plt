set terminal X11 noenhanced
set title "DC Analysis: Normalized Drain Current vs Gate to Source Voltage (both axes negative)"
set xlabel "-Vgs: Negative Gate to Source Voltage (V)"
set ylabel "-Id/W Normalized Negative Drain Current (mA/um)"
set grid
unset logscale x 
set xrange [1.000000e-01:1.300000e+00]
unset logscale y 
set yrange [-2.175775e-02:4.569171e-01]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'dc_analysis_large_signal_id_vgs_vbs.data' using 1:2 with lines lw 1 title "(vds#branch*1e+03)/(@m1[w]*1e6)"
set terminal push
set terminal postscript eps color noenhanced
set out 'dc_analysis_large_signal_id_vgs_vbs.eps'
replot
set term pop
replot
