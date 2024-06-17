OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.3121303898144) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
s q[1];
rx(4.012632695721397) q[1];
u2(2.1392808180346274,3.161426154714143) q[2];
ccx q[4],q[3],q[0];
ryy(1.3121303898144) q[2],q[4];
cz q[3],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
