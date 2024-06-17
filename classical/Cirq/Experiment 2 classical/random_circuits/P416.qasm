OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.7363441760153857) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
swap q[0],q[1];
p(5.617327898563718) q[0];
u2(0.2473689875430508,1.9212755798766985) q[1];
y q[2];
id q[2];
ryy(3.7363441760153857) q[3],q[4];
tdg q[3];
tdg q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
