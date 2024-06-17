OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.060961327450791) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P176 q0,q1,q2,q3,q4 { rz(1.107807486201708) q0; sx q2; cz q3,q1; ryy(5.060961327450791) q1,q2; rx(2.5107238361436472) q4; ccx q0,q4,q3; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P176 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
