OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.016590911323063) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
ryy(5.016590911323063) q[1],q[0];
u1(2.696172593779693) q[0];
sxdg q[3];
z q[3];
cy q[4],q[2];
rxx(1.9403873468323856) q[1],q[4];
tdg q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
