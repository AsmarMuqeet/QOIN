OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
id q[0];
csx q[2],q[3];
cu1(4.675382443249583) q[2],q[0];
cu(2.8479221585009107,2.538036727017504,2.2226453454195627,2.41846538211652) q[1],q[4];
u1(2.040742683702517) q[1];
ch q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];