OPENQASM 2.0;
include "qelib1.inc";
gate gate_P477 q0,q1,q2,q3,q4 { id q0; id q0; s q1; cz q3,q2; rzz(2.5236499437111357) q1,q3; z q2; u(2.6627722664596396,0.945024110813143,3.7728074587378084) q4; tdg q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P477 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
