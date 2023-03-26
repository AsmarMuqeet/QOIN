OPENQASM 2.0;
include "qelib1.inc";
gate gate_P845 q0,q1,q2,q3,q4,q5,q6 { ry(5.236091813710682) q3; p(1.4678296597818254) q3; cu(4.48507899195874,5.865043440087865,0.7239242684552133,5.793106957648919) q4,q0; swap q0,q4; cz q5,q2; sx q5; rzz(3.320792026136336) q1,q6; ccx q1,q6,q2; }
qreg q[7];
creg c[3];
cx q[0],q[1];
gate_P845 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
