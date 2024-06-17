OPENQASM 2.0;
include "qelib1.inc";
gate gate_P570 q0,q1,q2,q3,q4 { x q0; rz(3.8964606756872513) q1; t q2; cy q1,q2; tdg q3; cy q3,q0; x q4; z q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P570 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
