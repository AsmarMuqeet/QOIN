OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
p(3.794792356538048) q[0];
ry(3.5209417843884165) q[1];
swap q[0],q[1];
cy q[0],q[1];
csx q[2],q[3];
cu(3.062899674662057,1.9865073707227778,5.554046631516223,3.51683837202866) q[3],q[2];
u1(5.003318744650825) q[2];
u1(1.159728630735137) q[3];
sx q[4];
y q[4];
sxdg q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
