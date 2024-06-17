OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.176094568045129,3.7245920226332867,-3.7245920226332867) q0; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[0];
r(4.176094568045129,5.295388349428183) q[1];
sxdg q[2];
z q[3];
rx(0.7077401084299517) q[3];
sdg q[4];
cy q[4],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
