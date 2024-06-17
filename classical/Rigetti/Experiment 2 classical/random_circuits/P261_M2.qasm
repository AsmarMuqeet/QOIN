OPENQASM 2.0;
include "qelib1.inc";
gate gate_P261 q0,q1,q2,q3,q4 { u1(5.321478850698797) q0; t q1; u3(4.850718238004037,3.1930990451477568,2.211873314259142) q1; cy q2,q3; z q2; cy q3,q0; tdg q4; sxdg q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[0];
gate_P261 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
