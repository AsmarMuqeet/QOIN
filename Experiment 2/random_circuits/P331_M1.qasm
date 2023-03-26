OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.23576402997813) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P331 q0,q1,q2,q3,q4 { sxdg q2; ccx q3,q1,q0; ryy(4.23576402997813) q0,q2; id q1; u2(3.986910686789912,6.0194654837223265) q4; csx q4,q3; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P331 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
