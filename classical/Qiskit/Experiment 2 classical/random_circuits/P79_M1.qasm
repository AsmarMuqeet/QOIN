OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.437560006949323) q1; cx q0,q1; h q1; }
gate r(param0,param1) q0 { u3(6.001825246140203,-0.5642957635225023,0.5642957635225023) q0; }
gate gate_P79 q0,q1,q2,q3,q4,q5,q6 { y q1; rx(4.8901723584814) q1; tdg q2; r(6.001825246140203,1.0065005632723942) q2; cy q0,q3; tdg q0; h q5; sxdg q5; rzx(3.437560006949323) q6,q4; crx(2.9429801210989757) q3,q6; id q4; }
qreg q[7];
creg c[3];
cx q[2],q[0];
gate_P79 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
