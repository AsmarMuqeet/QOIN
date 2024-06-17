OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.178611534025374) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
ryy(4.178611534025374) q[3],q[4];
u1(2.1306781492272533) q[4];
cx q[5],q[2];
ry(2.346254914087283) q[2];
cy q[5],q[3];
ccx q[0],q[6],q[1];
rz(4.931454986082784) q[0];
cu(5.1734603638607215,2.652563979803628,1.201060279523031,4.7881871908224785) q[6],q[1];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
