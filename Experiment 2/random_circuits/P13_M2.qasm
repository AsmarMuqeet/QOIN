OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.17074990004057594) q1; cx q0,q1; h q1; }
gate gate_P13 q0,q1,q2,q3,q4 { z q2; rzx(0.17074990004057594) q3,q0; u2(3.235150686190929,6.014509107942794) q3; cy q4,q1; cu(5.044567243279042,5.535579768726281,5.745106719874972,5.936498835384832) q1,q2; swap q4,q0; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P13 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
