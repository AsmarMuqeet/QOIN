OPENQASM 2.0;
include "qelib1.inc";
gate gate_P407 q0,q1,q2,q3,q4,q5,q6 { swap q2,q0; ccx q4,q1,q5; y q4; cy q5,q1; cx q6,q3; cu1(0.3976994974781996) q2,q3; cx q6,q0; }
qreg q[7];
creg c[3];
ccx q[2],q[1],q[3];
gate_P407 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
