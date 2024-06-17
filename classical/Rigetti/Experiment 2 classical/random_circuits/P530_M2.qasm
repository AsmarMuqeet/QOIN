OPENQASM 2.0;
include "qelib1.inc";
gate gate_P530 q0,q1,q2,q3,q4 { x q1; cx q0,q2; y q0; id q3; id q3; u1(1.2366481855880802) q4; ccx q2,q1,q4; ccx q0,q4,q3; s q1; cu(1.2455288640222757,1.866195418596421,0.5115592559632762,1.9825917288082284) q1,q0; sxdg q2; cy q3,q2; id q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P530 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
