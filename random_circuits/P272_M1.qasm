OPENQASM 2.0;
include "qelib1.inc";
gate gate_P272 q0,q1,q2,q3,q4 { cu1(4.393772550253959) q1,q0; s q1; tdg q2; csx q0,q2; sdg q3; u2(0.18092314904673065,2.3401089099932366) q3; tdg q4; rz(3.3836269963135073) q4; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P272 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
