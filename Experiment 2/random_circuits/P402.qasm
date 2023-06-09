OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(1.6599529742702441,3.4062365503589502,-3.4062365503589502) q0; }
qreg q[7];
creg c[3];
r(1.6599529742702441,4.977032877153847) q[1];
sxdg q[2];
cp(0.318747535170195) q[1],q[2];
swap q[3],q[5];
ccx q[0],q[4],q[6];
u2(2.5125245657038993,3.021746343329566) q[0];
crx(3.313556181416937) q[3],q[4];
crz(4.918939588911081) q[6],q[5];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
