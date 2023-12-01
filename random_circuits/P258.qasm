OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.795877192468547) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
u(2.1622836753199217,6.0593826819926475,3.956288317874007) q[2];
cx q[0],q[3];
y q[0];
sxdg q[3];
csx q[4],q[1];
tdg q[1];
csx q[4],q[2];
sdg q[5];
sx q[6];
ryy(5.795877192468547) q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
