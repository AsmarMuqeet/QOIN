OPENQASM 2.0;
include "qelib1.inc";
gate gate_P683 q0,q1,q2,q3,q4 { p(2.7253804809070417) q2; cswap q3,q1,q0; sxdg q0; p(3.204402633571485) q0; x q1; u(0.09619199397097829,4.304408138222679,5.756300776829131) q1; cx q3,q2; t q2; x q4; u2(2.990869018788753,0.5384071963214075) q4; crz(3.569127554831887) q4,q3; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P683 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
