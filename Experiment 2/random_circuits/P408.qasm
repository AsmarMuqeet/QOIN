OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.104042184869232) q1; cx q0,q1; h q1; }
gate r(param0,param1) q0 { u3(3.143326296870947,1.1208838767775577,-1.1208838767775577) q0; }
qreg q[7];
creg c[3];
rz(1.431275952545756) q[1];
rzx(5.104042184869232) q[0],q[3];
rzz(0.016027722312307917) q[3],q[0];
cz q[2],q[4];
u1(5.391857982035311) q[2];
ry(6.043062211101234) q[4];
rx(2.476033228250349) q[5];
cx q[5],q[1];
r(3.143326296870947,2.6916802035724543) q[6];
rz(3.005988083649562) q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];