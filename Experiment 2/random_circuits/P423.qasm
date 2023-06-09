OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.8679714660574) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
s q[0];
x q[0];
ry(3.3360003048443594) q[0];
sx q[1];
ryy(2.8679714660574) q[3],q[2];
u1(5.813728918418722) q[3];
u(3.5227176205704205,5.8201069711992695,0.5773657155633443) q[4];
cswap q[2],q[4],q[1];
cp(1.0222548993332463) q[3],q[1];
cu(0.8881112933824531,2.210226822005538,0.4179123811250286,2.4735951595117145) q[4],q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
