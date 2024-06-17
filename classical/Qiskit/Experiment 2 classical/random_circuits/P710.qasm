OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.8812363856811539) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
rz(5.114832530596392) q[2];
ryy(0.8812363856811539) q[0],q[3];
csx q[0],q[3];
rxx(1.4736085122065845) q[1],q[4];
cswap q[4],q[1],q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
