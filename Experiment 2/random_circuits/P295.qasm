OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
rxx(5.153734837169721) q[0],q[2];
csx q[0],q[2];
u1(2.4370147874829162) q[2];
y q[3];
sdg q[3];
csx q[3],q[0];
p(1.9198161687447095) q[0];
id q[3];
cu1(6.073283728930258) q[4],q[1];
swap q[4],q[1];
sdg q[1];
cz q[2],q[1];
cx q[2],q[3];
id q[2];
sdg q[3];
tdg q[4];
id q[4];
cswap q[4],q[0],q[1];
u(0.5223834328995907,3.740226991889866,0.3865450854485316) q[0];
u2(5.146921589642884,0.425433648871421) q[1];
tdg q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
