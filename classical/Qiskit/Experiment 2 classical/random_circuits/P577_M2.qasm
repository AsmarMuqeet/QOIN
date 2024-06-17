OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
gate ryy_139921317470320(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.959659603970473) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.269073751848615) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P577 q0,q1,q2,q3,q4,q5,q6 { u3(3.6402474988657363,3.9553013462557813,4.207039299656678) q1; ryy(1.269073751848615) q2,q0; x q0; tdg q0; rz(2.8486983864714004) q2; rz(0.6326434027483057) q2; ry(1.9631729784111438) q3; ryy_139921317470320(1.959659603970473) q1,q3; p(0.8059591771372447) q4; id q4; x q4; p(5.423389251671542) q5; id q5; cp(1.0696939230213676) q5,q1; p(1.8848164000181071) q6; sx q6; iswap q3,q6; }
qreg q[7];
creg c[3];
ccx q[0],q[2],q[3];
gate_P577 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
