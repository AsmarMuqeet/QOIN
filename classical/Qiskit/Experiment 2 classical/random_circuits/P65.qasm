OPENQASM 2.0;
include "qelib1.inc";
gate rcccx q0,q1,q2,q3 { u2(0,pi) q3; u1(pi/4) q3; cx q2,q3; u1(-pi/4) q3; u2(0,pi) q3; cx q0,q3; u1(pi/4) q3; cx q1,q3; u1(-pi/4) q3; cx q0,q3; u1(pi/4) q3; cx q1,q3; u1(-pi/4) q3; u2(0,pi) q3; u1(pi/4) q3; cx q2,q3; u1(-pi/4) q3; u2(0,pi) q3; }
qreg q[7];
creg c[3];
cz q[0],q[1];
s q[0];
rx(5.230658075577211) q[1];
sdg q[3];
cy q[4],q[5];
cy q[2],q[6];
z q[2];
rcccx q[5],q[6],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
