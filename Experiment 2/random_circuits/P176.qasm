OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.060961327450791) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
rz(1.107807486201708) q[0];
sx q[2];
cz q[3],q[1];
ryy(5.060961327450791) q[1],q[2];
rx(2.5107238361436472) q[4];
ccx q[0],q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
