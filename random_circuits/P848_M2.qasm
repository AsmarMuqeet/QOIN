OPENQASM 2.0;
include "qelib1.inc";
gate gate_P848 q0,q1,q2,q3,q4 { sdg q2; cu(4.841264432321787,1.7153107688877263,1.7682540391021722,2.124478192637877) q0,q3; cz q3,q2; cu1(4.460040088126658) q4,q1; tdg q1; cy q4,q0; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[4];
gate_P848 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
