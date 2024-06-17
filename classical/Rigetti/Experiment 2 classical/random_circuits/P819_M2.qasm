OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.301185312105838) q1; cx q0,q1; h q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.557632163465023) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P819 q0,q1,q2,q3,q4 { h q0; ryy(0.557632163465023) q3,q2; rzx(3.301185312105838) q1,q4; swap q0,q1; cswap q3,q4,q2; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[4];
gate_P819 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
