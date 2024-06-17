OPENQASM 2.0;
include "qelib1.inc";
gate gate_P377 q0,q1,q2,q3,q4 { rzz(3.274188243488393) q0,q2; s q0; ccx q4,q3,q1; ccx q2,q1,q4; sxdg q3; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[0];
gate_P377 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
