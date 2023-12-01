OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.0517419312100107) q1; cx q0,q1; h q1; }
gate gate_P468 q0,q1,q2,q3,q4 { u1(5.646468104172268) q0; x q1; rzx(3.0517419312100107) q1,q0; sxdg q2; x q2; rx(2.4693294128123897) q3; y q4; swap q4,q3; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[0];
gate_P468 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
