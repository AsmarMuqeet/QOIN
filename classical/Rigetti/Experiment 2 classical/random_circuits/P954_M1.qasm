OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.2936987292124136) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P954 q0,q1,q2,q3,q4 { ryy(1.2936987292124136) q1,q2; rz(5.4961990430847445) q2; cx q3,q0; t q3; h q4; cswap q0,q1,q4; rz(1.828967194337982) q1; cp(1.0413562485472359) q2,q4; cu(0.6428058662725686,3.8856510447443227,5.502911199936771,1.899662571960503) q3,q0; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[4];
gate_P954 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
