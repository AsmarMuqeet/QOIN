OPENQASM 2.0;
include "qelib1.inc";
gate gate_P87 q0,q1,q2,q3,q4 { rx(5.096891619539232) q0; u1(5.277022856068077) q1; id q2; cu1(4.913997216069038) q3,q4; cswap q0,q1,q3; cz q4,q2; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[4];
gate_P87 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
