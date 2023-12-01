OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.7981107253769594) q1; cx q0,q1; h q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.08948500538180766) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
cx q[3],q[1];
rzz(1.1248586513665046) q[0],q[4];
cz q[1],q[4];
rzx(0.7981107253769594) q[2],q[5];
ryy(0.08948500538180766) q[2],q[5];
ry(6.0254982524527705) q[6];
ccx q[0],q[6],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
