OPENQASM 2.0;
include "qelib1.inc";
gate gate_P357 q0,q1,q2,q3,q4 { t q1; sxdg q1; csx q0,q2; u3(5.324565362816777,5.398717316076683,5.4351669866734085) q2; rxx(2.6943914559572635) q1,q2; u2(2.1735146624187807,5.163754319473578) q3; u1(3.6639649122240185) q4; cswap q4,q0,q3; sx q0; sxdg q3; swap q0,q3; y q4; cswap q2,q4,q1; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[4];
gate_P357 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
