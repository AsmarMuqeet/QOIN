OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.7800419566347792) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
u(5.21218821571142,1.1421802892408224,0.7150790354960587) q[0];
cz q[3],q[2];
rzx(1.7800419566347792) q[2],q[3];
z q[3];
rxx(3.510535563135532) q[4],q[1];
ry(0.8851443030434759) q[1];
swap q[4],q[0];
sdg q[0];
cswap q[4],q[1],q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
