set terminal X11 noenhanced
set title "transmission line test"
set xlabel "s"
set ylabel "V"
set grid
unset logscale x 
set xrange [0.000000e+00:1.000000e-07]
unset logscale y 
set yrange [-5.000000e-02:1.050000e+00]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
plot 'transmission_line_test.data' using 1:2 with lines lw 1 title "v(n0)",\
'transmission_line_test.data' using 3:4 with lines lw 1 title "v(n1)",\
'transmission_line_test.data' using 5:6 with lines lw 1 title "v(n2)"
