OPENQASM 2.0;
include "qelib1.inc";
gate gate_P860 q0,q1,q2,q3,q4 { cswap q2,q1,q0; u2(4.427185026303311,1.4324690855046005) q0; swap q2,q1; s q3; p(1.0541698263750785) q4; crx(0.7310929167495842) q3,q4; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P860 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
