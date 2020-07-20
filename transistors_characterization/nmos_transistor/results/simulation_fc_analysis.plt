set terminal X11 noenhanced
set title "Fc vs. ng"
set xlabel "ng"
set ylabel "Fc transconductor intrinsic gain (MHz)"
set grid
unset logscale x 
set xrange [5.000000e-02:1.300000e+00]
unset logscale y 
set yrange [-1.955568e+16:2.677529e+17]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'simulation_fc_analysis.data' using 1:2 with lines lw 1 title "dc11.fc",\
'simulation_fc_analysis.data' using 3:4 with lines lw 1 title "dc10.fc",\
'simulation_fc_analysis.data' using 5:6 with lines lw 1 title "dc9.fc",\
'simulation_fc_analysis.data' using 7:8 with lines lw 1 title "dc8.fc",\
'simulation_fc_analysis.data' using 9:10 with lines lw 1 title "dc7.fc",\
'simulation_fc_analysis.data' using 11:12 with lines lw 1 title "dc6.fc",\
'simulation_fc_analysis.data' using 13:14 with lines lw 1 title "dc5.fc",\
'simulation_fc_analysis.data' using 15:16 with lines lw 1 title "dc4.fc",\
'simulation_fc_analysis.data' using 17:18 with lines lw 1 title "dc3.fc",\
'simulation_fc_analysis.data' using 19:20 with lines lw 1 title "dc2.fc"
set terminal push
set terminal postscript eps color noenhanced
set out 'simulation_fc_analysis.eps'
replot
set term pop
replot
