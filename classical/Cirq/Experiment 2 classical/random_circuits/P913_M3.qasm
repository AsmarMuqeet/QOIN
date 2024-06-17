OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(5.352527531648034,4.087922703867643,-4.087922703867643) q0; }
gate gate_P913 q0,q1,q2,q3,q4,q5,q6 { sxdg q0; r(5.352527531648034,5.65871903066254) q0; id q1; cswap q5,q2,q3; cz q1,q5; sxdg q2; cu1(0.3183340627372356) q4,q6; cy q3,q4; id q6; }
qreg q[7];
creg c[3];
cx q[0],q[1];
gate_P913 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
