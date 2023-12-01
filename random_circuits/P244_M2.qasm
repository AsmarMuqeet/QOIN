OPENQASM 2.0;
include "qelib1.inc";
gate gate_P244 q0,q1,q2,q3,q4 { sdg q2; p(4.968949485770666) q2; cp(5.8594653656803635) q0,q3; sxdg q0; rx(2.978875966687619) q3; cp(4.438063439261307) q1,q4; s q1; s q4; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[4];
gate_P244 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
