OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
creg c[3];
cp(0.18268409002982428) q[0],q[2];
sxdg q[2];
u1(5.840614967073983) q[3];
cu1(0.8941602235399753) q[0],q[3];
sdg q[4];
u(3.5805059336961707,0.425149546412958,4.589512222906218) q[5];
s q[5];
swap q[1],q[6];
cu1(3.524101029541472) q[1],q[4];
rz(4.253883566225575) q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];