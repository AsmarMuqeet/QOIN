OPENQASM 2.0;
include "qelib1.inc";
gate gate_P228 q0,q1,q2,q3,q4,q5,q6 { id q0; p(4.629763720360341) q1; tdg q2; swap q4,q3; rzz(3.118629813098806) q1,q4; rx(3.30629648191956) q3; rx(4.919848887450741) q5; u(1.3548103488245218,5.762849148995288,0.061071204112963094) q5; h q6; cswap q2,q6,q0; }
qreg q[7];
creg c[3];
ccx q[1],q[0],q[4];
gate_P228 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
