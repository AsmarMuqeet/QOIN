OPENQASM 2.0;
include "qelib1.inc";
gate gate_P424 q0,q1,q2,q3,q4 { p(0.42736105459403767) q0; u1(6.103912671965761) q0; p(1.4364429193383956) q2; cz q3,q1; cx q2,q1; u2(2.9290739704948834,2.8391583952541994) q3; y q4; sxdg q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P424 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
