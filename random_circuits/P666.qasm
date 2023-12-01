OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.350321691249483) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
y q[1];
rzz(2.0627610255185784) q[2],q[0];
y q[0];
x q[3];
ryy(4.350321691249483) q[1],q[3];
sdg q[4];
swap q[4],q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
