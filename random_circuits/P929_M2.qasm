OPENQASM 2.0;
include "qelib1.inc";
gate gate_P929 q0,q1,q2,q3,q4 { p(0.7324154011859549) q0; rz(3.68985099592506) q1; sx q2; cy q4,q3; cswap q0,q4,q2; cu(5.1967803655099685,6.234951723677907,0.10882626211208692,4.1041702368238235) q3,q1; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P929 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
