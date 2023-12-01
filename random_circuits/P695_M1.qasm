OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
gate gate_P695 q0,q1,q2,q3,q4,q5,q6 { sxdg q2; sxdg q2; cu1(0.30339558253694454) q0,q4; sdg q4; dcx q5,q3; t q5; cx q6,q1; csx q0,q1; crz(5.987294271267885) q6,q3; }
qreg q[7];
creg c[3];
ccx q[1],q[2],q[3];
gate_P695 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
