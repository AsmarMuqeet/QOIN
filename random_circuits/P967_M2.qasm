OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.842595404527845) q1; cx q0,q1; h q1; }
gate gate_P967 q0,q1,q2,q3,q4 { u1(2.859538561040956) q0; s q2; id q3; rzx(1.842595404527845) q3,q2; cx q1,q4; swap q0,q1; rx(2.7642948604680804) q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[3];
gate_P967 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
