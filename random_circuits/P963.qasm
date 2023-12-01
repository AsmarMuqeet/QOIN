OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.32438686155704) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
p(3.9972747737900165) q[0];
x q[3];
cy q[3],q[0];
ccx q[2],q[4],q[1];
s q[1];
rzx(3.32438686155704) q[2],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
