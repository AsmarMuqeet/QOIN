OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.8287059522376716) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy_140286651936432(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.6320094496305346) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
u2(5.382319819170852,4.658094115408842) q[2];
u2(5.406267528888774,3.9580449983517467) q[2];
rxx(0.3217433435644378) q[1],q[3];
ryy(1.8287059522376716) q[5],q[4];
ryy_140286651936432(3.6320094496305346) q[1],q[4];
cy q[6],q[0];
rzz(4.56905377271014) q[0],q[3];
ch q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
