OPENQASM 2.0;
include "qelib1.inc";
gate gate_P294 q0,q1,q2,q3,q4 { sxdg q0; s q2; u(3.0266576839208104,5.464336007088942,2.4674634652267033) q2; rzz(0.8906092435163988) q1,q3; t q1; ry(6.07110989210006) q3; y q4; cz q0,q4; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[1];
gate_P294 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
