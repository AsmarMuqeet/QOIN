OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
creg c[3];
z q[0];
u(2.9865236934934516,1.479427935114228,6.030590285072964) q[0];
u(0.8914428322584125,5.570608011936399,5.825244695037308) q[1];
rzz(6.081263385617497) q[3],q[2];
sdg q[2];
csx q[5],q[4];
swap q[1],q[5];
cu1(0.8692052717462085) q[3],q[4];
t q[6];
ry(2.0903094178417825) q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
