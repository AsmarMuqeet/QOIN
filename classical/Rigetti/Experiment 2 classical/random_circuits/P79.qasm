OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(6.001825246140203,-0.5642957635225023,0.5642957635225023) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.437560006949323) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
y q[1];
rx(4.8901723584814) q[1];
tdg q[2];
r(6.001825246140203,1.0065005632723942) q[2];
cy q[0],q[3];
tdg q[0];
h q[5];
sxdg q[5];
rzx(3.437560006949323) q[6],q[4];
crx(2.9429801210989757) q[3],q[6];
id q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
