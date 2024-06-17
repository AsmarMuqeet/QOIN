OPENQASM 2.0;
include "qelib1.inc";
gate gate_P797 q0,q1,q2,q3,q4,q5,q6 { u1(2.0597014344761555) q2; sx q3; sxdg q3; cy q0,q4; u2(5.526219663261694,3.354108418966161) q0; t q5; csx q5,q2; cp(5.296266075555938) q6,q1; cu1(4.585832839281595) q1,q4; rz(5.679489261835453) q6; }
qreg q[7];
creg c[3];
cx q[1],q[0];
gate_P797 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
