OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
u1(3.41014257012256) q[1];
s q[1];
u1(3.198688584165524) q[2];
id q[3];
csx q[0],q[4];
rzz(3.0032037734043153) q[2],q[4];
cu1(1.671661832646775) q[3],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];