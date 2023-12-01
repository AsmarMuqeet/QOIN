OPENQASM 2.0;
include "qelib1.inc";
gate gate_P428 q0,q1,q2,q3,q4,q5,q6 { rz(0.8274788648627195) q1; ry(0.5758727646011422) q1; cx q3,q2; cy q5,q4; crx(0.26030474562345934) q4,q3; swap q5,q2; cu3(1.210164101692595,0.8628083675471444,0.6566855203926377) q0,q6; rx(3.1920747851716773) q0; x q6; }
qreg q[7];
creg c[3];
cx q[2],q[0];
gate_P428 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
