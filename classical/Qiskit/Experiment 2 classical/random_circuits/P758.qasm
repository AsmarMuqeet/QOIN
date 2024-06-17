OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.3481284047314532) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r(param0,param1) q0 { u3(4.128335513127181,4.0404913694651565,-4.0404913694651565) q0; }
qreg q[7];
creg c[3];
tdg q[1];
cx q[0],q[2];
csx q[1],q[0];
rz(2.5412001984769006) q[4];
t q[4];
cswap q[3],q[5],q[6];
ryy(1.3481284047314532) q[2],q[3];
r(4.128335513127181,5.611287696260053) q[5];
u1(5.490847828582455) q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
