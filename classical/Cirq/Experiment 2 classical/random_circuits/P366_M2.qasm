OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.269461521183908) q1; cx q0,q1; h q1; }
gate gate_P366 q0,q1,q2,q3,q4,q5,q6 { cz q0,q2; u1(4.844520660861425) q0; rxx(0.47156085252390584) q1,q4; id q1; cp(0.6828917083990611) q3,q5; rzx(2.269461521183908) q2,q3; cp(2.4112099071381774) q5,q4; sdg q6; sxdg q6; }
qreg q[7];
creg c[3];
cx q[0],q[1];
gate_P366 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
