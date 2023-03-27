OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.8887148326346255,-1.025162424779965,1.025162424779965) q0; }
qreg q[5];
creg c[3];
x q[1];
ry(6.182416710796666) q[1];
u3(5.096224238863873,2.6990633338748085,4.771542689753548) q[2];
tdg q[2];
rzz(6.070328336356899) q[0],q[3];
r(4.8887148326346255,0.5456339020149314) q[0];
rz(1.4802842888735719) q[3];
id q[4];
u1(1.753667632026301) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];