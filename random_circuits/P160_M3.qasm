OPENQASM 2.0;
include "qelib1.inc";
gate gate_P160 q0,q1,q2,q3,q4 { sxdg q0; sdg q1; cp(1.2073432796656025) q0,q1; cu1(4.7376369382629795) q0,q1; id q2; sdg q3; id q3; id q4; cu1(3.4948993196117053) q2,q4; rxx(2.5981245179593646) q2,q3; ry(2.590076427954302) q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P160 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
