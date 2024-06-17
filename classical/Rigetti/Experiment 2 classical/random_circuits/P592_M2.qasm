OPENQASM 2.0;
include "qelib1.inc";
gate gate_P592 q0,q1,q2,q3,q4,q5,q6 { sxdg q0; p(3.6189608121856742) q1; sx q2; p(6.0351717085344285) q2; cswap q3,q5,q4; cswap q0,q1,q5; u1(1.9739138172072515) q3; z q4; sx q6; sx q6; }
qreg q[7];
creg c[3];
ccx q[0],q[2],q[1];
gate_P592 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
