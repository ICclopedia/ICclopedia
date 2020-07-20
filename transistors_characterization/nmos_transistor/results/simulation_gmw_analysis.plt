set terminal X11 noenhanced
set title "gm/W vs. ng"
set xlabel "ng"
set ylabel "gm/W transconductor area efficiency (S/um)"
set grid
unset logscale x 
set xrange [5.000000e-02:1.300000e+00]
unset logscale y 
set yrange [-5.111618e-04:1.073503e-02]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'simulation_gmw_analysis.data' using 1:2 with lines lw 1 title "dc11.gmw",\
'simulation_gmw_analysis.data' using 3:4 with lines lw 1 title "dc10.gmw",\
'simulation_gmw_analysis.data' using 5:6 with lines lw 1 title "dc9.gmw",\
'simulation_gmw_analysis.data' using 7:8 with lines lw 1 title "dc8.gmw",\
'simulation_gmw_analysis.data' using 9:10 with lines lw 1 title "dc7.gmw",\
'simulation_gmw_analysis.data' using 11:12 with lines lw 1 title "dc6.gmw",\
'simulation_gmw_analysis.data' using 13:14 with lines lw 1 title "dc5.gmw",\
'simulation_gmw_analysis.data' using 15:16 with lines lw 1 title "dc4.gmw",\
'simulation_gmw_analysis.data' using 17:18 with lines lw 1 title "dc3.gmw",\
'simulation_gmw_analysis.data' using 19:20 with lines lw 1 title "dc2.gmw"
set terminal push
set terminal postscript eps color noenhanced
set out 'simulation_gmw_analysis.eps'
replot
set term pop
replot
