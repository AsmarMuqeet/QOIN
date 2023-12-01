OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.442427644223215) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
cx q[0],q[1];
s q[1];
ryy(4.442427644223215) q[2],q[3];
cu1(5.848401192793301) q[0],q[2];
u(6.193216214332105,3.99944922408023,5.815298692937032) q[4];
crx(4.221026351184734) q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
