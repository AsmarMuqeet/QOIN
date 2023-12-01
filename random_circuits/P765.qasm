OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(6.081249857335059) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
cu3(4.7093657236620805,3.325874941607069,3.2133610875298877) q[0],q[1];
rz(1.2581144521303544) q[3];
ryy(6.081249857335059) q[2],q[4];
cz q[1],q[4];
ccx q[3],q[2],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
