OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.4853865512614854) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P706 q0,q1,q2,q3,q4,q5,q6 { t q1; sdg q3; cswap q2,q4,q0; ryy(1.4853865512614854) q1,q0; id q2; swap q6,q5; sdg q5; cswap q6,q4,q3; }
qreg q[7];
creg c[3];
ccx q[2],q[1],q[4];
gate_P706 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
