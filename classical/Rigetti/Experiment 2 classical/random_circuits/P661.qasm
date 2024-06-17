OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(6.204092269446024) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
swap q[1],q[2];
cu3(0.5200010933763494,2.247857751545865,5.115515596853022) q[1],q[2];
rzx(6.204092269446024) q[3],q[0];
tdg q[0];
ry(0.2668427293823849) q[4];
crx(1.072532914960228) q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
