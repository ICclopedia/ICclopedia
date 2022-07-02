set terminal X11 noenhanced
set title "DC Analysis: Normalized Drain Current vs Drain to Source Voltage"
set xlabel "Drain to Source Voltage (V)"
set ylabel "Normalized Drain Current (mA/um)"
set grid
unset logscale x 
set xrange [0.000000e+00:1.300000e+00]
unset logscale y 
set yrange [-4.842391e-02:1.016820e+00]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'dc_analysis_large_signal_id_vds_vgs.data' using 1:2 with lines lw 1 title "(-vds#branch*1e+03)/(@m1[w]*1e6)"
set terminal push
set terminal postscript eps color noenhanced
set out 'dc_analysis_large_signal_id_vds_vgs.eps'
replot
set term pop
replot
