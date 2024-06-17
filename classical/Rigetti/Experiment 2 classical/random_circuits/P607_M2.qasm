OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.132844857064035) q1; cx q0,q1; h q1; }
gate gate_P607 q0,q1,q2,q3,q4 { sx q1; rzx(5.132844857064035) q3,q2; rzz(0.7123371143069707) q2,q1; sdg q3; cy q4,q0; s q0; u1(2.2227100496561984) q4; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[2];
gate_P607 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
