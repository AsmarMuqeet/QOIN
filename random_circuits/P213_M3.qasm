OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(5.951287393292589,0.49680771500020837,-0.49680771500020837) q0; }
gate gate_P213 q0,q1,q2,q3,q4 { cz q1,q0; ry(3.4334020402234047) q0; z q1; r(5.951287393292589,2.067604041795105) q3; sxdg q3; cu1(3.722897392321692) q2,q4; t q2; sx q4; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P213 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
