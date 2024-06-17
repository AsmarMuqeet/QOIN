OPENQASM 2.0;
include "qelib1.inc";
gate gate_P306 q0,q1,q2,q3,q4 { z q1; u2(4.620608699595523,2.2835388785114277) q3; rx(0.36594476457406494) q3; ccx q0,q2,q4; cp(4.692533151435271) q0,q1; swap q2,q4; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[4];
gate_P306 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
