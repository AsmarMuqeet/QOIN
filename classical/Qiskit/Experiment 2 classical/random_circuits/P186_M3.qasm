OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.5281927535628191) q1; cx q0,q1; h q1; }
gate gate_P186 q0,q1,q2,q3,q4 { ry(5.635665664540941) q1; s q1; ry(0.19727640776565672) q2; t q3; rzx(0.5281927535628191) q4,q0; u(1.858916088651699,3.6700963664896222,3.567864069756513) q0; ccx q4,q3,q2; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P186 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
