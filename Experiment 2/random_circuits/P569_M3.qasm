OPENQASM 2.0;
include "qelib1.inc";
gate gate_P569 q0,q1,q2,q3,q4,q5,q6 { rx(4.120315062718161) q0; u3(4.482677654751731,3.2638966265361176,1.7676396628455062) q2; z q2; id q2; u2(3.2951535535056,0.8007391228551591) q3; t q4; csx q5,q1; ry(6.023313246757747) q1; s q1; cx q3,q5; sdg q3; rx(0.26600035500101366) q5; u(2.1901539836685413,0.4894034336698493,5.7671214594154625) q6; ccx q6,q4,q0; x q0; tdg q4; t q6; }
qreg q[7];
creg c[3];
ccx q[2],q[0],q[1];
gate_P569 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];