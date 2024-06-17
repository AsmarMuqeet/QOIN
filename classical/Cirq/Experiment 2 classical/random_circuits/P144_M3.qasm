OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.7800419566347792) q1; cx q0,q1; h q1; }
gate gate_P144 q0,q1,q2,q3,q4 { u(5.21218821571142,1.1421802892408224,0.7150790354960587) q0; cz q3,q2; rzx(1.7800419566347792) q2,q3; z q3; rxx(3.510535563135532) q4,q1; ry(0.8851443030434759) q1; swap q4,q0; sdg q0; cswap q4,q1,q2; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[1];
gate_P144 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
