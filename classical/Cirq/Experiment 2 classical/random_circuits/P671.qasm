OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.48142557910115513) q1; cx q0,q1; h q1; }
gate r(param0,param1) q0 { u3(4.960693569801725,1.6962324980389503,-1.6962324980389503) q0; }
qreg q[5];
creg c[3];
sx q[1];
h q[2];
sxdg q[2];
rzx(0.48142557910115513) q[3],q[0];
sxdg q[0];
r(4.960693569801725,3.267028824833847) q[3];
p(1.4002899811978222) q[4];
rzz(1.4471560784079176) q[1],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
