OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(1.2699812319227766,1.5581824199026775,-1.5581824199026775) q0; }
qreg q[5];
creg c[3];
r(1.2699812319227766,3.128978746697574) q[1];
cu3(1.0596585325771601,5.6449066641876735,3.012605704881771) q[0],q[2];
cswap q[1],q[2],q[0];
y q[3];
ry(3.9956215988984645) q[3];
sdg q[4];
sdg q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];