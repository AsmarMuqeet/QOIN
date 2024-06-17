OPENQASM 2.0;
include "qelib1.inc";
gate gate_P685 q0,q1,q2,q3,q4 { tdg q0; u2(4.850378848923972,0.7646716301832136) q2; h q2; cy q1,q3; sx q1; y q4; ccx q4,q3,q0; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[1];
gate_P685 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
