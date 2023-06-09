OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.48522934882758,1.9325261119066117,-1.9325261119066117) q0; }
qreg q[5];
creg c[3];
csx q[0],q[1];
sx q[2];
cswap q[0],q[2],q[1];
cx q[0],q[2];
r(4.48522934882758,3.5033224387015083) q[1];
s q[1];
swap q[2],q[0];
u(0.4976592811502432,1.872016698216485,0.9396794557929635) q[3];
u(5.786429106438583,3.8163450182073646,1.3568837558733289) q[4];
cx q[3],q[4];
csx q[3],q[4];
cy q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
