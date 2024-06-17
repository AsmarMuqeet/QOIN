OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.7319316874210515) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
t q[0];
h q[1];
t q[1];
s q[3];
ryy(0.7319316874210515) q[3],q[0];
u2(3.961207861262608,6.119172083958897) q[4];
h q[5];
ry(0.6489398674022544) q[5];
cz q[6],q[2];
csx q[4],q[2];
sxdg q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
