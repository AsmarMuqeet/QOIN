OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(5.265930038903686,-1.3695874618503352,1.3695874618503352) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.0278967637118076) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy_139921335427280(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.885360263152343) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
r(5.265930038903686,0.20120886494456133) q[0];
id q[1];
u1(1.6208500145150104) q[1];
tdg q[1];
id q[2];
u3(1.1471537457376264,4.20213631530779,5.4917389970624635) q[2];
sdg q[3];
ryy(0.0278967637118076) q[0],q[3];
sxdg q[0];
x q[0];
tdg q[3];
z q[3];
sdg q[4];
y q[4];
ryy_139921335427280(3.885360263152343) q[4],q[2];
swap q[1],q[4];
z q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
