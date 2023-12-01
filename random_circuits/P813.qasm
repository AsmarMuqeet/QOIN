OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
qreg q[7];
creg c[3];
rx(6.003508312943031) q[0];
rx(4.112487664306497) q[1];
cu1(6.159836845724382) q[0],q[1];
h q[2];
sxdg q[2];
z q[4];
z q[4];
rz(4.374611594384175) q[5];
dcx q[6],q[3];
cy q[5],q[3];
y q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
