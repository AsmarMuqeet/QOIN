OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.2549943485643813) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P209 q0,q1,q2,q3,q4 { tdg q0; id q2; cx q0,q2; cswap q4,q3,q1; rx(3.831569998443374) q3; ryy(3.2549943485643813) q4,q1; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P209 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
