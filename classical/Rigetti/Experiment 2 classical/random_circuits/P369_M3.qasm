OPENQASM 2.0;
include "qelib1.inc";
gate gate_P369 q0,q1,q2,q3,q4 { x q0; ccx q1,q3,q2; u1(3.1660034827854244) q1; cswap q2,q0,q3; x q4; u1(6.254893135765338) q4; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[0];
gate_P369 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
