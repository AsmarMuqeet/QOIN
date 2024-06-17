OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.5281927535628191) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
ry(5.635665664540941) q[1];
s q[1];
ry(0.19727640776565672) q[2];
t q[3];
rzx(0.5281927535628191) q[4],q[0];
u(1.858916088651699,3.6700963664896222,3.567864069756513) q[0];
ccx q[4],q[3],q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
