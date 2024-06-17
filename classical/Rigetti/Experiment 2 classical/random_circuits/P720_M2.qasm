OPENQASM 2.0;
include "qelib1.inc";
gate gate_P720 q0,q1,q2,q3,q4 { s q0; ry(2.17263399098836) q0; rz(2.796326646185398) q1; t q2; sx q2; h q2; cu1(1.9168022058138188) q3,q4; ccx q1,q3,q4; cswap q1,q4,q0; rx(5.199265706181139) q3; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P720 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
