OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
cu3(5.675235233075043,0.23703667247012147,3.1309839877219177) q[1],q[2];
tdg q[1];
swap q[3],q[0];
cx q[2],q[3];
rz(0.21640729668719116) q[4];
cu(0.15809328658514615,6.25898024394458,4.1870570703992245,2.1662544272484743) q[4],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
