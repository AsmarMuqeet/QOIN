OPENQASM 2.0;
include "qelib1.inc";
gate gate_P409 q0,q1,q2,q3,q4 { u2(5.6630704891213215,0.44866485564417774) q0; cy q3,q1; cx q0,q1; rz(3.6319167115622557) q3; cu(5.4024617050618025,3.5005165837616796,1.4103753415475726,5.100941852118135) q4,q2; y q2; s q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P409 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
