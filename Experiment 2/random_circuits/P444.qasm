OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
cx q[0],q[1];
rz(1.2891165457613978) q[0];
t q[3];
rz(2.9801534004415897) q[3];
csx q[2],q[4];
x q[2];
rxx(5.623430024161368) q[4],q[1];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
