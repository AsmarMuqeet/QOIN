OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
creg c[3];
ry(5.236091813710682) q[3];
p(1.4678296597818254) q[3];
cu(4.48507899195874,5.865043440087865,0.7239242684552133,5.793106957648919) q[4],q[0];
swap q[0],q[4];
cz q[5],q[2];
sx q[5];
rzz(3.320792026136336) q[1],q[6];
ccx q[1],q[6],q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
