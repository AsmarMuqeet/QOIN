OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.763610613359388,-1.3349479857903397,1.3349479857903397) q0; }
qreg q[7];
creg c[3];
z q[1];
u2(3.448501152121124,4.365108687553404) q[1];
u2(4.8490453481714715,5.056681286435953) q[2];
rx(2.0437312650406403) q[2];
rzz(5.794460184232595) q[3],q[0];
u1(0.0292653591555931) q[0];
r(4.763610613359388,0.23584834100455687) q[4];
cz q[3],q[4];
h q[5];
u(5.429427754697733,0.09929567281560744,2.1972424823943744) q[5];
ry(0.6055832971550222) q[6];
t q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];