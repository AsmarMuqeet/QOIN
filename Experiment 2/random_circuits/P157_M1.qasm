OPENQASM 2.0;
include "qelib1.inc";
gate gate_P157 q0,q1,q2,q3,q4 { cy q1,q0; u1(1.713602330060802) q1; sdg q2; h q2; y q3; u1(5.45986477988234) q3; s q4; cp(2.013520234428404) q4,q0; cp(0.09233224936322554) q0,q1; ccx q4,q3,q2; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P157 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
