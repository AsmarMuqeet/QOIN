OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
id q[0];
u(4.315461000914879,4.093582890522974,2.566190467527074) q[1];
sx q[1];
rxx(5.917484630186902) q[3],q[2];
sx q[2];
cx q[3],q[0];
x q[4];
id q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
