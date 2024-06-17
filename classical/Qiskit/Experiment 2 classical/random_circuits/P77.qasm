OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(6.193831933256437) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
rzx(6.193831933256437) q[2],q[1];
u(5.4357166044394125,0.9509529562694639,4.560556242866193) q[2];
cp(1.6920447144743973) q[3],q[0];
z q[0];
cz q[3],q[1];
rz(3.8329218114908903) q[4];
z q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
