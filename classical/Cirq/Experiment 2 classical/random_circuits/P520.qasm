OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.0317329427153268) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
p(0.6673421617703064) q[0];
ryy(1.0317329427153268) q[1],q[3];
cy q[0],q[1];
cz q[2],q[4];
cx q[2],q[3];
u2(0.48696931094587365,0.7569745988356176) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
