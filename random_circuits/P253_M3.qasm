OPENQASM 2.0;
include "qelib1.inc";
gate gate_P253 q0,q1,q2,q3,q4 { rx(2.661487544851544) q1; t q2; cp(3.179118620307178) q1,q2; rx(2.9957557531724612) q1; rx(3.4173353416899928) q2; x q2; rxx(3.8547964843001807) q3,q0; u(0.43979704251318275,0.5535704763251786,1.0474062028909463) q4; cswap q0,q3,q4; cswap q4,q0,q3; ry(1.3622224693269815) q0; cy q1,q3; sdg q4; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P253 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
