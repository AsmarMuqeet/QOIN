OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.1874499749803087) q1; cx q0,q1; h q1; }
gate gate_P317 q0,q1,q2,q3,q4 { sxdg q0; sx q1; u1(0.7011925491927605) q2; cu3(5.320268541060699,5.078538237492116,1.8922133674001125) q2,q1; p(4.217393786067473) q1; rz(0.15638464144868455) q2; u2(0.9455566949522357,1.7048302866275975) q3; rzx(1.1874499749803087) q0,q3; y q4; ry(0.7850177570726997) q4; cswap q3,q4,q0; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P317 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
