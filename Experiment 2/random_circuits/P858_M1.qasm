OPENQASM 2.0;
include "qelib1.inc";
gate gate_P858 q0,q1,q2,q3,q4 { h q1; rx(3.22360073490292) q1; rxx(1.7469166798000773) q2,q0; swap q2,q0; cx q4,q3; swap q4,q3; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[1];
gate_P858 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
