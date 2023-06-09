OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.09715004237346542) q1; cx q0,q1; h q1; }
gate gate_P893 q0,q1,q2,q3,q4,q5,q6 { rx(4.679175573844077) q0; y q0; u2(2.98804785248207,5.063469546835104) q0; swap q1,q2; rz(3.198195024502758) q1; s q3; ry(3.5463286877236673) q3; rzx(0.09715004237346542) q3,q1; cx q4,q5; rzz(5.715132308007009) q2,q5; u1(2.6591300495755323) q2; z q4; id q4; u2(2.9566218601541316,2.535849738566124) q5; rz(6.003369066563717) q6; sxdg q6; ry(2.3917120578628155) q6; }
qreg q[7];
creg c[3];
cx q[1],q[0];
gate_P893 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
