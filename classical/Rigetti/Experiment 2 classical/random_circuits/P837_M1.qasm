OPENQASM 2.0;
include "qelib1.inc";
gate gate_P837 q0,q1,q2,q3,q4 { rzz(1.4500824484194688) q0,q1; s q1; s q2; u(0.42718574197735104,0.21440866761868585,2.678547443073921) q3; cz q3,q2; rz(5.1418589773790995) q4; swap q4,q0; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P837 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
