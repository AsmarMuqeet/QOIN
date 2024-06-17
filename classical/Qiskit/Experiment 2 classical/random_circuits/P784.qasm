OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(5.90365312820899,1.4828846805227234,-1.4828846805227234) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.5232999500121566) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
y q[0];
r(5.90365312820899,3.05368100731762) q[1];
h q[2];
u1(4.584005968653195) q[3];
cswap q[1],q[3],q[2];
u(2.0347534451544567,6.199798020321993,1.5686058225065154) q[1];
sdg q[3];
z q[4];
ryy(0.5232999500121566) q[4],q[0];
cswap q[2],q[4],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
