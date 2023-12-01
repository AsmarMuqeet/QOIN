OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.29529943020813126) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
s q[0];
csx q[4],q[1];
u2(0.23103319645641693,6.127726839108221) q[4];
cswap q[3],q[5],q[2];
cy q[1],q[3];
cz q[2],q[5];
u2(2.5821476729502613,0.8999131453802415) q[6];
rzx(0.29529943020813126) q[0],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
