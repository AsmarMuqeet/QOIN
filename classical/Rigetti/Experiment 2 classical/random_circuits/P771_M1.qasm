OPENQASM 2.0;
include "qelib1.inc";
gate xx_minus_yy(param0,param1) q0,q1 { rz(-5.697862259317531) q1; rz(-pi/2) q0; sx q0; rz(pi/2) q0; s q1; cx q0,q1; ry(1.8649312060558667) q0; ry(-1.8649312060558667) q1; cx q0,q1; sdg q1; rz(-pi/2) q0; sxdg q0; rz(pi/2) q0; rz(5.697862259317531) q1; }
gate gate_P771 q0,q1,q2,q3,q4,q5,q6 { cx q0,q2; rxx(5.973927498761886) q0,q2; sdg q0; rx(5.702268837900422) q2; u2(6.271699291351184,5.0614831648429925) q3; xx_minus_yy(3.7298624121117334,5.697862259317531) q4,q5; id q4; h q5; cu1(1.3698386384471162) q5,q4; rzz(2.9143300678922395) q1,q6; sdg q1; sxdg q1; csx q3,q6; rzz(1.477423147191563) q6,q3; }
qreg q[7];
creg c[3];
cx q[0],q[1];
gate_P771 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
