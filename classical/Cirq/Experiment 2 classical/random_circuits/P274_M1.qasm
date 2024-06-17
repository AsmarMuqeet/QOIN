OPENQASM 2.0;
include "qelib1.inc";
gate gate_P274 q0,q1,q2,q3,q4 { ccx q2,q3,q1; tdg q1; rzz(2.394965871075628) q3,q2; swap q0,q4; p(3.217482692182252) q0; rx(5.798732245782928) q4; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[3];
gate_P274 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
