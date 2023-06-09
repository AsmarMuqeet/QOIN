OPENQASM 2.0;
include "qelib1.inc";
gate gate_P537 q0,q1,q2,q3,q4 { sdg q1; u2(4.96947505420928,3.0514631521455833) q1; id q1; cswap q0,q3,q2; z q0; u(4.240001573725059,6.20955049631963,3.6014227629146514) q3; id q4; rzz(5.491558644142928) q2,q4; cu3(6.247255246505488,2.3411698853951264,3.308508236424875) q0,q4; cp(2.7548971819335115) q3,q2; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P537 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
