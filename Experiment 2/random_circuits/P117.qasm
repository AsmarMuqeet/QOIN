OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
creg c[3];
z q[0];
z q[0];
cy q[1],q[2];
z q[4];
cx q[4],q[1];
y q[5];
csx q[2],q[5];
cry(1.7421075803185293) q[3],q[6];
cu(1.9039085579086399,4.606658287593762,4.323484055164498,2.8184050876341167) q[3],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
