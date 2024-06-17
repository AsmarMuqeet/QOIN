OPENQASM 2.0;
include "qelib1.inc";
gate gate_P557 q0,q1,q2,q3,q4 { h q0; rz(2.21394388901094) q0; u1(0.536020206221248) q2; u(2.164310116460137,3.9600530507658394,6.148042466004868) q2; sxdg q3; id q3; swap q4,q1; t q1; t q4; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[3];
gate_P557 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
