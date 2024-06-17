OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.442427644223215) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P962 q0,q1,q2,q3,q4 { cx q0,q1; s q1; ryy(4.442427644223215) q2,q3; cu1(5.848401192793301) q0,q2; u(6.193216214332105,3.99944922408023,5.815298692937032) q4; crx(4.221026351184734) q4,q3; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[3];
gate_P962 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
