OPENQASM 2.0;
include "qelib1.inc";
gate gate_P956 q0,q1,q2,q3,q4,q5,q6 { y q1; rz(1.7920453786196504) q2; cu3(1.7447611922624258,2.8267301130881304,3.007277507805453) q3,q0; csx q3,q0; u1(5.120194694587846) q4; x q4; cu(3.386727789965154,5.2975233025272495,4.959115458947286,1.8212392371187693) q5,q6; cp(4.149754675533861) q2,q5; cz q6,q1; }
qreg q[7];
creg c[3];
cx q[1],q[2];
gate_P956 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
