OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
creg c[3];
ry(0.9243436521272331) q[0];
u1(2.3524843933343993) q[1];
id q[2];
z q[3];
y q[3];
csx q[4],q[5];
ccx q[2],q[5],q[0];
id q[6];
ccx q[6],q[1],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
