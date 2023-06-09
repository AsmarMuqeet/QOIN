OPENQASM 2.0;
include "qelib1.inc";
gate gate_P895 q0,q1,q2,q3,q4 { rz(5.397230660159056) q2; x q2; rxx(4.309517516303023) q0,q3; cu(5.757149622669819,3.556563246523487,2.8141429857932514,4.037469754404162) q4,q1; rzz(1.1082020115353275) q0,q4; swap q0,q2; rzz(4.701528280021145) q3,q1; u1(1.9363970932480912) q3; csx q4,q1; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P895 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
