OPENQASM 2.0;
include "qelib1.inc";
gate gate_P102 q0,q1,q2,q3,q4 { h q2; p(2.164809023727726) q2; rz(5.085646302795497) q2; y q3; sxdg q3; z q3; rxx(5.6017031246387035) q2,q3; cswap q4,q0,q1; u2(0.6722202614550606,1.1906351080114754) q0; swap q4,q1; cswap q1,q0,q4; cy q1,q0; csx q2,q0; u1(5.467089021627164) q4; cswap q1,q3,q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[1];
gate_P102 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
