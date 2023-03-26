OPENQASM 2.0;
include "qelib1.inc";
gate gate_P31 q0,q1,q2,q3,q4 { u3(1.183228119954737,1.5154720793767549,1.3496235154635918) q1; sdg q1; cu3(1.491479406487796,0.09105043055758653,0.40462472800895294) q2,q0; h q3; csx q0,q3; ry(0.3028322315498465) q4; cy q2,q4; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[3];
gate_P31 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
