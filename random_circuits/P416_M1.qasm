OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.7363441760153857) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P416 q0,q1,q2,q3,q4 { swap q0,q1; p(5.617327898563718) q0; u2(0.2473689875430508,1.9212755798766985) q1; y q2; id q2; ryy(3.7363441760153857) q3,q4; tdg q3; tdg q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P416 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
