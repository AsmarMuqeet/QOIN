OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(5.352527531648034,4.087922703867643,-4.087922703867643) q0; }
qreg q[7];
creg c[3];
sxdg q[0];
r(5.352527531648034,5.65871903066254) q[0];
id q[1];
cswap q[5],q[2],q[3];
cz q[1],q[5];
sxdg q[2];
cu1(0.3183340627372356) q[4],q[6];
cy q[3],q[4];
id q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
