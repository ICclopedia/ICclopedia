set terminal X11 noenhanced
set title "DC Analysis: Drain Current Output vs Drain Voltage"
set xlabel "Drain Voltage (V)"
set ylabel "Drain Current Output (uA)"
set grid
unset logscale x 
set xrange [0.000000e+00:1.300000e+00]
unset logscale y 
set yrange [-2.516965e+00:5.265947e+01]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'dc.data' using 1:2 with lines lw 1 title "(v2#branch*-1e+06)"
set terminal push
set terminal postscript eps color noenhanced
set out 'dc.eps'
replot
set term pop
replot
