OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(5.951287393292589,0.49680771500020837,-0.49680771500020837) q0; }
qreg q[5];
creg c[3];
cz q[1],q[0];
ry(3.4334020402234047) q[0];
z q[1];
r(5.951287393292589,2.067604041795105) q[3];
sxdg q[3];
cu1(3.722897392321692) q[2],q[4];
t q[2];
sx q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
