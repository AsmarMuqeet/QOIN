OPENQASM 2.0;
include "qelib1.inc";
gate gate_P547 q0,q1,q2,q3,q4 { id q0; sxdg q0; rzz(5.677182672361316) q1,q2; cp(5.3920574873325995) q2,q1; sxdg q1; rz(4.883946379466736) q3; u(1.060172760125509,3.0014017434710696,0.0935454124443752) q3; u2(4.243903116707376,5.159780854193294) q3; u1(2.7241135673633647) q4; id q4; cswap q2,q0,q4; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[3];
gate_P547 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
