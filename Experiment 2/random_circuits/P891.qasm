OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.8772940765390462,-1.1550852672170018,1.1550852672170018) q0; }
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
qreg q[5];
creg c[3];
sxdg q[1];
tdg q[1];
r(0.8772940765390462,0.41571105957789484) q[1];
y q[2];
t q[2];
u2(2.054102235397145,2.632184050759477) q[3];
x q[3];
cz q[0],q[4];
z q[0];
cy q[0],q[2];
sxdg q[4];
dcx q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
