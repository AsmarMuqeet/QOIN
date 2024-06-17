OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.9554675659697328,-0.3988887687172029,0.3988887687172029) q0; }
qreg q[5];
creg c[3];
cswap q[1],q[0],q[2];
csx q[1],q[2];
x q[3];
r(0.9554675659697328,1.1719075580776936) q[3];
s q[4];
csx q[0],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
