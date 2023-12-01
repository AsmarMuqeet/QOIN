OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.605957741798149) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
rz(0.6624768204590062) q[0];
tdg q[1];
ryy(5.605957741798149) q[2],q[3];
ry(1.7755267045694356) q[2];
cu1(1.9257686468771547) q[3],q[0];
t q[4];
cz q[1],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
