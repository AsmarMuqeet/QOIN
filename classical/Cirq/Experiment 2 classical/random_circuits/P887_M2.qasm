OPENQASM 2.0;
include "qelib1.inc";
gate gate_P887 q0,q1,q2,q3,q4 { ccx q3,q1,q0; cp(5.734741954748324) q1,q3; cu1(4.956815883671088) q2,q4; cswap q2,q0,q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[3];
gate_P887 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
