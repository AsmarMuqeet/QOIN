OPENQASM 2.0;
include "qelib1.inc";
gate gate_P599 q0,q1,q2,q3,q4 { cu(2.1177681545588194,2.4654171819636086,5.948063208419635,5.4257255534380535) q2,q0; cy q2,q0; cp(0.3433350767954206) q3,q1; u2(0.022951534305701283,2.3872416211128646) q4; cswap q1,q4,q3; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P599 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
