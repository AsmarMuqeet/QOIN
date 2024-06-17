OPENQASM 2.0;
include "qelib1.inc";
gate gate_P78 q0,q1,q2,q3,q4 { cp(1.5529714669614472) q3,q2; cswap q0,q4,q1; cy q0,q3; cy q1,q2; s q4; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[4];
gate_P78 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
