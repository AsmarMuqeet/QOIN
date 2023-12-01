OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.956672050754548) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
sx q[1];
x q[1];
sxdg q[1];
csx q[0],q[2];
ryy(4.956672050754548) q[2],q[0];
sx q[0];
ry(4.4408425267824105) q[2];
u(4.83566150874054,5.380983222207602,5.018047781143692) q[3];
sdg q[4];
ch q[3],q[4];
cry(6.083503547210192) q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
