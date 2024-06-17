OPENQASM 2.0;
include "qelib1.inc";
gate gate_P857 q0,q1,q2,q3,q4,q5,q6 { ry(1.434894789681936) q0; cp(1.6507421798190864) q3,q2; h q2; sxdg q5; u3(4.968156435370713,1.1553502649710958,4.910735562694162) q5; cswap q6,q1,q4; sx q1; cswap q4,q3,q0; t q6; }
qreg q[7];
creg c[3];
cx q[2],q[0];
gate_P857 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
