OPENQASM 2.0;
include "qelib1.inc";
gate gate_P184 q0,q1,q2,q3,q4 { u(3.7262266365598546,5.7632735399406565,3.99405111514995) q0; sx q0; u1(0.28735521781425155) q2; csx q1,q3; s q1; sxdg q4; ccx q2,q4,q3; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[4];
gate_P184 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
