OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
creg c[3];
csx q[2],q[1];
ry(5.827627521235936) q[1];
tdg q[2];
ry(2.324163311458492) q[4];
ry(2.0787222703133765) q[4];
cy q[5],q[0];
rz(2.3537389113508196) q[5];
rzz(3.3608718546446017) q[6],q[3];
cu1(0.593554916957232) q[0],q[3];
t q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];