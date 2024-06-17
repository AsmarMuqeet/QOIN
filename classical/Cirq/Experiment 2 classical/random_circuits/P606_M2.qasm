OPENQASM 2.0;
include "qelib1.inc";
gate gate_P606 q0,q1,q2,q3,q4,q5,q6 { sxdg q0; sxdg q0; t q1; rz(5.228752117988313) q1; t q3; tdg q3; cu1(5.05064795346145) q5,q4; rz(2.446943511239509) q5; cp(5.29151275708663) q2,q6; rzz(6.190429585171821) q2,q4; t q6; }
qreg q[7];
creg c[3];
cx q[0],q[1];
gate_P606 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
