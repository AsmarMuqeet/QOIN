OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.645452894023021) q1; cx q0,q1; h q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.0972587500676985) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
rzx(4.645452894023021) q[1],q[4];
ryy(1.0972587500676985) q[5],q[0];
cx q[0],q[1];
u1(0.7496519704856015) q[5];
cswap q[2],q[6],q[3];
rx(4.731796712695868) q[2];
ccx q[3],q[6],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
