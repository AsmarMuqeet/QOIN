OPENQASM 2.0;
include "qelib1.inc";
gate gate_P767 q0,q1,q2,q3,q4 { p(0.6226724122666188) q1; tdg q1; u2(4.273686010008829,2.185371290316606) q2; swap q0,q3; ry(2.51717962977115) q0; u3(3.1290561723041974,0.8045786227686891,1.7501891713277868) q4; ccx q4,q2,q3; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P767 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
