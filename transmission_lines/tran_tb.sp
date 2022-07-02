Transmission Line Test

* Applying step
V1 n0 0 0 pulse(0 1)

* Applying pulse of width Tbit
*V1 n0 0 0 pulse(0 1 0 0 0 10nS 0 0)

* Source impedance Zs
R1 n0 ntx 0

* Transmission line with Zo=50 and td=2nS
T1 ntx 0 nrx 0 z0=50 td=2nS

* Load impedance Zl
*R2 n2 0 50

.CONTROL

tran 0.1nS 100nS

plot v(n0) v(ntx) v(nrx)

.ENDC
.END
