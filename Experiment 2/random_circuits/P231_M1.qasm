OPENQASM 2.0;
include "qelib1.inc";
gate gate_P231 q0,q1,q2,q3,q4 { z q1; id q2; cy q0,q3; cswap q0,q1,q3; ry(0.7777288248378567) q0; u2(2.607726096972321,1.4655530075427623) q1; id q4; cz q4,q2; s q2; cx q4,q3; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[4];
gate_P231 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
