OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
sx q[0];
sxdg q[1];
ry(2.570470230576654) q[2];
sxdg q[2];
u2(1.5731016701951066,4.542310160543821) q[2];
u1(0.7162165221174313) q[3];
cu3(3.0613242257172293,4.52868933050611,1.8957350859150932) q[0],q[3];
z q[0];
z q[3];
u(2.1762728368701216,3.71593860009622,4.110084777867939) q[4];
cu3(0.29017167065616406,5.737243324810334,4.941010173809248) q[4],q[1];
u1(5.7936881218850225) q[1];
sdg q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];