OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
s q[1];
cy q[0],q[2];
cu(3.9615815297424892,4.598201761778255,0.04863595519375005,2.927332459994593) q[2],q[1];
sxdg q[3];
sdg q[3];
u1(2.4140286188181204) q[4];
cz q[0],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
