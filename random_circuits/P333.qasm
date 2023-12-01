OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
z q[1];
cp(4.700625016733895) q[0],q[3];
cu(4.343816373730643,3.1200117153789972,2.099096417983502,4.728603750017692) q[1],q[0];
csx q[2],q[4];
csx q[2],q[3];
id q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];