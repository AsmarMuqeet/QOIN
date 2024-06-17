OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.350321691249483) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P666 q0,q1,q2,q3,q4 { y q1; rzz(2.0627610255185784) q2,q0; y q0; x q3; ryy(4.350321691249483) q1,q3; sdg q4; swap q4,q2; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P666 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
