OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.700585265099062,-0.35107146225489827,0.35107146225489827) q0; }
gate gate_P292 q0,q1,q2,q3,q4 { rzz(6.192741232980038) q0,q1; ccx q2,q3,q4; r(4.700585265099062,1.2197248645399983) q2; swap q3,q1; cu3(1.9513503222910622,2.7984450927802658,0.11833691387232277) q4,q0; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P292 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
