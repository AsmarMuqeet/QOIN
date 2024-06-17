OPENQASM 2.0;
include "qelib1.inc";
gate gate_P181 q0,q1,q2,q3,q4 { rz(5.752383799871399) q0; sdg q1; u2(0.11119916505766277,0.569062475747768) q2; rzz(5.396448985883235) q2,q1; ry(1.9844420296089658) q3; cp(4.630378959227214) q0,q3; x q4; u1(4.428212460232125) q4; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[4];
gate_P181 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
