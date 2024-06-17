OPENQASM 2.0;
include "qelib1.inc";
gate gate_P952 q0,q1,q2,q3,q4 { x q2; cy q3,q1; rxx(2.1951046666451837) q0,q4; ccx q0,q1,q3; rzz(4.779768443562802) q2,q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[3];
gate_P952 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
