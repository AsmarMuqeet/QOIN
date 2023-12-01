OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(5.894498120423972,2.279761818564563,-2.279761818564563) q0; }
gate gate_P41 q0,q1,q2,q3,q4 { cy q3,q0; r(5.894498120423972,3.8505581453594595) q3; sdg q3; cswap q1,q2,q4; csx q2,q0; id q0; rz(5.478446149190244) q2; rzz(2.0111954797829403) q4,q1; p(1.8730211258044172) q1; rz(4.373122851856898) q4; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P41 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
