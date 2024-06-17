OPENQASM 2.0;
include "qelib1.inc";
gate gate_P940 q0,q1,q2,q3,q4 { x q1; sx q1; id q2; u2(3.600586576358368,5.973919590122932) q2; cp(0.5788510253186482) q0,q3; sx q0; x q4; crz(2.758045171062614) q4,q3; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[3];
gate_P940 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
