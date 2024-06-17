OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.7777054659824579) q1; cx q0,q1; h q1; }
gate gate_P11 q0,q1,q2,q3,q4 { rzx(0.7777054659824579) q1,q0; p(0.9535267565709636) q2; cz q4,q3; swap q1,q4; cswap q2,q0,q3; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P11 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
