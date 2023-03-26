OPENQASM 2.0;
include "qelib1.inc";
gate gate_P342 q0,q1,q2,q3,q4 { u2(0.5243508649147735,3.4660771211113137) q0; y q0; id q1; sx q1; u1(4.843751375904165) q2; z q2; x q3; ry(4.157496075647439) q4; cp(0.014332693646281694) q3,q4; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P342 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
