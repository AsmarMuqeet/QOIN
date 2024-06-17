OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.2936987292124136) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
ryy(1.2936987292124136) q[1],q[2];
rz(5.4961990430847445) q[2];
cx q[3],q[0];
t q[3];
h q[4];
cswap q[0],q[1],q[4];
rz(1.828967194337982) q[1];
cp(1.0413562485472359) q[2],q[4];
cu(0.6428058662725686,3.8856510447443227,5.502911199936771,1.899662571960503) q[3],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
