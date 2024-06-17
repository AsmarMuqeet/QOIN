OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.152791689156672) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
z q[1];
t q[1];
u1(1.729101612883667) q[3];
rxx(2.531511594596906) q[4],q[2];
cu(1.8847028637844896,5.701355388097324,0.18102230907694583,2.7198866916052937) q[5],q[0];
rz(4.466150580916485) q[0];
id q[0];
iswap q[3],q[5];
cry(1.8911808814335638) q[3],q[5];
sxdg q[6];
cswap q[4],q[6],q[2];
rzx(1.152791689156672) q[2],q[1];
swap q[4],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
