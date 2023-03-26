OPENQASM 2.0;
include "qelib1.inc";
gate gate_P918 q0,q1,q2,q3,q4 { x q1; rz(3.697930878702727) q1; ccx q2,q0,q3; sx q0; sx q2; s q4; cp(3.0567203396114486) q3,q4; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P918 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
