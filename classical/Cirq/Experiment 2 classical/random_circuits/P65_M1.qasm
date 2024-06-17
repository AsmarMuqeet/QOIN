OPENQASM 2.0;
include "qelib1.inc";
gate rcccx q0,q1,q2,q3 { u2(0,pi) q3; u1(pi/4) q3; cx q2,q3; u1(-pi/4) q3; u2(0,pi) q3; cx q0,q3; u1(pi/4) q3; cx q1,q3; u1(-pi/4) q3; cx q0,q3; u1(pi/4) q3; cx q1,q3; u1(-pi/4) q3; u2(0,pi) q3; u1(pi/4) q3; cx q2,q3; u1(-pi/4) q3; u2(0,pi) q3; }
gate gate_P65 q0,q1,q2,q3,q4,q5,q6 { cz q0,q1; s q0; rx(5.230658075577211) q1; sdg q3; cy q4,q5; cy q2,q6; z q2; rcccx q5,q6,q3,q4; }
qreg q[7];
creg c[3];
cx q[0],q[2];
gate_P65 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
