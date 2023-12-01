OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(6.269942938795289) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy_139921318265952(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.983396804004397) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
ryy(6.269942938795289) q[2],q[1];
h q[1];
sxdg q[2];
t q[2];
s q[4];
s q[5];
cswap q[3],q[6],q[0];
swap q[0],q[5];
t q[5];
cswap q[6],q[4],q[3];
ccx q[4],q[3],q[0];
ryy_139921318265952(5.983396804004397) q[6],q[1];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
