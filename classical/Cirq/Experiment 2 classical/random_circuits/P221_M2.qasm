OPENQASM 2.0;
include "qelib1.inc";
gate gate_P221 q0,q1,q2,q3,q4 { ccx q3,q2,q0; swap q3,q2; rxx(3.77639747574751) q4,q1; cp(1.9239245923537276) q1,q0; u2(0.2803270175406779,5.263958789018363) q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[4];
gate_P221 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
