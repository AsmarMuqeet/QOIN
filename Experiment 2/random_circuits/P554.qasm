OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.452601413008024,1.8726627411142158,-1.8726627411142158) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(6.059414233447761) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
sxdg q[0];
r(4.452601413008024,3.4434590679091124) q[1];
rzx(6.059414233447761) q[1],q[0];
u3(2.393052731780586,6.165062450774929,4.135141961137219) q[3];
u2(3.352262240881369,0.41709482607610027) q[3];
rxx(2.84804339451636) q[4],q[2];
ry(3.6497010992488836) q[2];
u2(5.537173764100231,0.5218229720468955) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];