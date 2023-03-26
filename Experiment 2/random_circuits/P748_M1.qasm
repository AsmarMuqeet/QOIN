OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.016590911323063) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P748 q0,q1,q2,q3,q4 { ryy(5.016590911323063) q1,q0; u1(2.696172593779693) q0; sxdg q3; z q3; cy q4,q2; rxx(1.9403873468323856) q1,q4; tdg q2; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[4];
gate_P748 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
