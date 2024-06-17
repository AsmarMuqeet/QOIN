OPENQASM 2.0;
include "qelib1.inc";
gate gate_P365 q0,q1,q2,q3,q4 { u(4.995184862705045,2.0030978132353305,4.620422253018587) q0; sxdg q2; u1(2.1003717373046147) q2; ccx q1,q3,q4; cu1(0.5230264919200687) q0,q3; tdg q1; sdg q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[4];
gate_P365 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
