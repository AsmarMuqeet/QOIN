OPENQASM 2.0;
include "qelib1.inc";
gate rzx_139921317651888(param0) q0,q1 { h q1; cx q0,q1; rz(1.7983643461336523) q1; cx q0,q1; h q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.8375766452676976) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
id q[1];
id q[3];
cswap q[2],q[0],q[4];
rzx_139921317651888(1.7983643461336523) q[2],q[3];
s q[4];
u(1.1504559837096242,5.7851143981996636,0.28014856941129473) q[5];
rzx(1.8375766452676976) q[0],q[5];
rz(4.366449732214402) q[6];
rxx(3.973509383020526) q[6],q[1];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
