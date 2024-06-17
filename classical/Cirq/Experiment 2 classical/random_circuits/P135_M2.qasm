OPENQASM 2.0;
include "qelib1.inc";
gate gate_P135 q0,q1,q2,q3,q4 { tdg q1; cu1(4.472441374229275) q0,q2; h q0; cx q1,q2; id q3; ry(2.901345678267651) q4; cu(3.590391055336578,5.238636441799797,3.417686679991033,0.9565186938460075) q4,q3; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[4];
gate_P135 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
