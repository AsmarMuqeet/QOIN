OPENQASM 2.0;
include "qelib1.inc";
gate xx_plus_yy(param0,param1) q0,q1 { rz(3.094750779716437) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-2.673518343442101) q1; ry(-2.673518343442101) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-3.094750779716437) q0; }
qreg q[5];
creg c[3];
t q[1];
cx q[0],q[2];
y q[0];
rzz(2.923896140092029) q[2],q[1];
xx_plus_yy(5.347036686884202,3.094750779716437) q[4],q[3];
t q[3];
t q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
