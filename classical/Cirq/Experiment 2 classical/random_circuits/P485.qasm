OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
creg c[3];
y q[3];
u2(5.313147897116565,5.192556900771814) q[3];
u3(5.817926845129679,1.8098247195609036,3.4136790831884367) q[4];
cx q[0],q[5];
z q[0];
cswap q[6],q[1],q[2];
id q[1];
swap q[4],q[2];
cu(4.605290176470598,6.034423251862851,0.725833396939756,1.2578238037740177) q[6],q[5];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];