OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
gate gate_P219 q0,q1,q2,q3,q4,q5,q6 { y q1; sx q1; u(3.806648916807828,1.2020075807258555,5.808405989110278) q2; sx q4; cy q3,q5; x q3; iswap q4,q5; t q4; s q5; rxx(2.9639220088879754) q0,q6; ry(5.1752517278489725) q0; cu3(0.5866196830657933,5.583903182877918,0.6169608855891505) q6,q2; cu3(6.224702511215025,5.458461323447205,4.173182718338763) q2,q3; ccx q6,q0,q1; }
qreg q[7];
creg c[3];
ccx q[0],q[1],q[3];
gate_P219 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
