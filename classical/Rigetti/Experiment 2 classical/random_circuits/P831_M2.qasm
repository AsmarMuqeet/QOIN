OPENQASM 2.0;
include "qelib1.inc";
gate rzx_139921353549472(param0) q0,q1 { h q1; cx q0,q1; rz(0.2503256836354495) q1; cx q0,q1; h q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.367719647798904) q1; cx q0,q1; h q1; }
gate gate_P831 q0,q1,q2,q3,q4,q5,q6 { u1(2.108319157542482) q0; y q2; cx q1,q3; cz q3,q0; ry(5.434415906400647) q4; rzx(4.367719647798904) q4,q1; rz(3.637989144386207) q5; u2(3.4389499434225645,6.073786641404815) q5; sxdg q6; rzx_139921353549472(0.2503256836354495) q6,q2; }
qreg q[7];
creg c[3];
cx q[0],q[2];
gate_P831 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
