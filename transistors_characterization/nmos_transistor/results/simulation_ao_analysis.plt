set terminal X11 noenhanced
set title "ao vs. ng"
set xlabel "ng"
set ylabel "ao transconductor intrinsic gain (dB)"
set grid
unset logscale x 
set xrange [5.000000e-02:1.300000e+00]
unset logscale y 
set yrange [1.633122e+01:5.910163e+01]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'simulation_ao_analysis.data' using 1:2 with lines lw 1 title "dc11.ao",\
'simulation_ao_analysis.data' using 3:4 with lines lw 1 title "dc10.ao",\
'simulation_ao_analysis.data' using 5:6 with lines lw 1 title "dc9.ao",\
'simulation_ao_analysis.data' using 7:8 with lines lw 1 title "dc8.ao",\
'simulation_ao_analysis.data' using 9:10 with lines lw 1 title "dc7.ao",\
'simulation_ao_analysis.data' using 11:12 with lines lw 1 title "dc6.ao",\
'simulation_ao_analysis.data' using 13:14 with lines lw 1 title "dc5.ao",\
'simulation_ao_analysis.data' using 15:16 with lines lw 1 title "dc4.ao",\
'simulation_ao_analysis.data' using 17:18 with lines lw 1 title "dc3.ao",\
'simulation_ao_analysis.data' using 19:20 with lines lw 1 title "dc2.ao"
set terminal push
set terminal postscript eps color noenhanced
set out 'simulation_ao_analysis.eps'
replot
set term pop
replot
