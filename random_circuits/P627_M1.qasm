OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.5093857002655454) q1; cx q0,q1; h q1; }
gate gate_P627 q0,q1,q2,q3,q4 { rzx(0.5093857002655454) q0,q1; h q0; ccx q2,q4,q3; cp(2.0980634554179436) q1,q2; u1(4.093937865905606) q1; cz q4,q3; swap q0,q3; swap q4,q2; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[4];
gate_P627 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
