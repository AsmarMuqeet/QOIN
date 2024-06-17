OPENQASM 2.0;
include "qelib1.inc";
gate gate_P855 q0,q1,q2,q3,q4,q5,q6 { id q0; h q0; s q1; id q2; cu1(2.756683012903038) q2,q1; rz(2.618167035485376) q3; p(2.5409770490853854) q5; y q5; rxx(1.526490105086223) q4,q6; swap q3,q4; u3(3.403110037131259,0.9405841884224654,1.2171792457300297) q6; }
qreg q[7];
creg c[3];
cx q[2],q[0];
gate_P855 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
