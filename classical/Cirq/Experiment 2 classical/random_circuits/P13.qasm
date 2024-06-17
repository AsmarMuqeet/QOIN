OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.17074990004057594) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
z q[2];
rzx(0.17074990004057594) q[3],q[0];
u2(3.235150686190929,6.014509107942794) q[3];
cy q[4],q[1];
cu(5.044567243279042,5.535579768726281,5.745106719874972,5.936498835384832) q[1],q[2];
swap q[4],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
