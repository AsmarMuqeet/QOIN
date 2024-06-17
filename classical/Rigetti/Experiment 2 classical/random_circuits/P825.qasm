OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.3577957396791034) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
x q[0];
h q[0];
sx q[1];
tdg q[1];
p(2.6850609251129542) q[2];
u1(2.748795736549403) q[2];
rzx(1.3577957396791034) q[3],q[4];
ry(1.141521546953513) q[3];
y q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
