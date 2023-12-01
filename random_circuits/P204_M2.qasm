OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.8375766452676976) q1; cx q0,q1; h q1; }
gate rzx_139921317651888(param0) q0,q1 { h q1; cx q0,q1; rz(1.7983643461336523) q1; cx q0,q1; h q1; }
gate gate_P204 q0,q1,q2,q3,q4,q5,q6 { id q1; id q3; cswap q2,q0,q4; rzx_139921317651888(1.7983643461336523) q2,q3; s q4; u(1.1504559837096242,5.7851143981996636,0.28014856941129473) q5; rzx(1.8375766452676976) q0,q5; rz(4.366449732214402) q6; rxx(3.973509383020526) q6,q1; }
qreg q[7];
creg c[3];
cx q[2],q[0];
gate_P204 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
