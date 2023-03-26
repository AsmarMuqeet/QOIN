OPENQASM 2.0;
include "qelib1.inc";
gate ryy_139921318265952(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.983396804004397) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(6.269942938795289) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P247 q0,q1,q2,q3,q4,q5,q6 { ryy(6.269942938795289) q2,q1; h q1; sxdg q2; t q2; s q4; s q5; cswap q3,q6,q0; swap q0,q5; t q5; cswap q6,q4,q3; ccx q4,q3,q0; ryy_139921318265952(5.983396804004397) q6,q1; }
qreg q[7];
creg c[3];
ccx q[1],q[2],q[4];
gate_P247 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
