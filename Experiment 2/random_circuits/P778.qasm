OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.3991671817360065) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
cy q[0],q[2];
rx(1.250450634908365) q[0];
h q[2];
ryy(1.3991671817360065) q[4],q[3];
x q[3];
u3(3.7274489291235953,5.13056243159953,5.039174562794708) q[5];
sxdg q[5];
rzz(4.556903147627993) q[6],q[1];
id q[1];
rxx(5.1092236330667795) q[4],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
