OPENQASM 2.0;
include "qelib1.inc";
gate gate_P120 q0,q1,q2,q3,q4,q5,q6 { csx q0,q1; tdg q0; p(3.450705907832216) q1; csx q2,q4; sdg q4; sx q5; rzz(3.4243771624164037) q6,q3; cx q2,q3; swap q6,q5; }
qreg q[7];
creg c[3];
cx q[1],q[2];
gate_P120 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
