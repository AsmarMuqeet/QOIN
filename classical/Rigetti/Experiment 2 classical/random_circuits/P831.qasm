OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.367719647798904) q1; cx q0,q1; h q1; }
gate rzx_139921353549472(param0) q0,q1 { h q1; cx q0,q1; rz(0.2503256836354495) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
u1(2.108319157542482) q[0];
y q[2];
cx q[1],q[3];
cz q[3],q[0];
ry(5.434415906400647) q[4];
rzx(4.367719647798904) q[4],q[1];
rz(3.637989144386207) q[5];
u2(3.4389499434225645,6.073786641404815) q[5];
sxdg q[6];
rzx_139921353549472(0.2503256836354495) q[6],q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
