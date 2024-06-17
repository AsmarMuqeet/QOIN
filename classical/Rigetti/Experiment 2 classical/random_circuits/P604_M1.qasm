OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.069491936215932) q1; cx q0,q1; h q1; }
gate gate_P604 q0,q1,q2,q3,q4 { sdg q0; h q2; u2(2.080052511223463,0.6155614581362039) q3; cp(3.866735611161691) q0,q3; s q0; rzx(4.069491936215932) q4,q1; swap q2,q1; s q2; x q2; u2(1.069286022787267,6.02633226755845) q4; cswap q3,q4,q1; cz q3,q1; csx q4,q0; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[2];
gate_P604 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
