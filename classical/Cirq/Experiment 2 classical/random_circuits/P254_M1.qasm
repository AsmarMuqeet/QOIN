OPENQASM 2.0;
include "qelib1.inc";
gate gate_P254 q0,q1,q2,q3,q4 { cu1(3.5370727240265976) q1,q2; s q1; p(0.2712296258145745) q2; cu1(3.6310040374104062) q3,q0; tdg q4; cswap q4,q3,q0; cp(3.6260435592259435) q0,q1; cz q2,q3; tdg q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P254 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
