set terminal X11 noenhanced
set title "FOM vs. ng"
set xlabel "ng"
set ylabel "FOM: gmid x Ft"
set grid
unset logscale x 
set xrange [5.000000e-02:1.300000e+00]
unset logscale y 
set yrange [-8.129443e+11:1.707197e+13]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'simulation_fom_analysis.data' using 1:2 with lines lw 1 title "dc11.fom",\
'simulation_fom_analysis.data' using 3:4 with lines lw 1 title "dc10.fom",\
'simulation_fom_analysis.data' using 5:6 with lines lw 1 title "dc9.fom",\
'simulation_fom_analysis.data' using 7:8 with lines lw 1 title "dc8.fom",\
'simulation_fom_analysis.data' using 9:10 with lines lw 1 title "dc7.fom",\
'simulation_fom_analysis.data' using 11:12 with lines lw 1 title "dc6.fom",\
'simulation_fom_analysis.data' using 13:14 with lines lw 1 title "dc5.fom",\
'simulation_fom_analysis.data' using 15:16 with lines lw 1 title "dc4.fom",\
'simulation_fom_analysis.data' using 17:18 with lines lw 1 title "dc3.fom",\
'simulation_fom_analysis.data' using 19:20 with lines lw 1 title "dc2.fom"
set terminal push
set terminal postscript eps color noenhanced
set out 'simulation_fom_analysis.eps'
replot
set term pop
replot
