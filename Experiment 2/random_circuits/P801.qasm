OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.1598613749918734) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
cz q[1],q[2];
h q[1];
cx q[3],q[0];
rzx(1.1598613749918734) q[2],q[0];
ry(1.3004553627313775) q[3];
t q[4];
tdg q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
