OPENQASM 2.0;
include "qelib1.inc";
gate gate_P829 q0,q1,q2,q3,q4,q5,q6 { tdg q0; ry(1.3983967719186858) q1; rz(3.929821822598385) q1; y q1; t q3; y q3; sdg q3; x q4; cu(0.3657844423969012,0.40987052513791217,5.309439812576211,0.2657059571247808) q4,q0; z q0; cu(5.241388073889686,5.462260482867441,1.7342482746023113,6.185779082930254) q0,q3; sxdg q4; cy q1,q4; cswap q2,q6,q5; sxdg q2; cx q5,q6; ry(1.9127638827602802) q5; rzz(1.9194559061403356) q6,q2; p(1.4749432874141166) q2; cz q6,q5; }
qreg q[7];
creg c[3];
cx q[1],q[0];
gate_P829 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];