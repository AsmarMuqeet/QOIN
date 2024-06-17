OPENQASM 2.0;
include "qelib1.inc";
gate gate_P624 q0,q1,q2,q3,q4,q5,q6 { sx q3; u(2.6368504523348095,4.02354588696381,4.8696958352423) q4; cz q3,q4; ccx q5,q0,q1; ry(2.614071868459683) q1; cu3(0.9769172111159901,5.283626682940351,0.3794829219722939) q2,q6; cz q5,q2; cy q6,q0; }
qreg q[7];
creg c[3];
ccx q[0],q[1],q[4];
gate_P624 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
