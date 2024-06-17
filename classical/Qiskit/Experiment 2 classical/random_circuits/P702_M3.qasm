OPENQASM 2.0;
include "qelib1.inc";
gate gate_P702 q0,q1,q2,q3,q4 { ry(5.138306065706416) q0; t q0; sdg q1; tdg q2; rxx(3.1783961518259813) q3,q4; cp(2.5076363970531617) q3,q1; cu1(3.393773936430928) q4,q2; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P702 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
