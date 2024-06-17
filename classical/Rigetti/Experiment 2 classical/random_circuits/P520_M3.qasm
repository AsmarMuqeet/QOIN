OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.0317329427153268) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P520 q0,q1,q2,q3,q4 { p(0.6673421617703064) q0; ryy(1.0317329427153268) q1,q3; cy q0,q1; cz q2,q4; cx q2,q3; u2(0.48696931094587365,0.7569745988356176) q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P520 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
