OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.2313495958109293) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
rxx(5.291568060527582) q[1],q[0];
u(0.7785470371815558,0.7126102219550476,3.615077239937977) q[2];
rzx(0.2313495958109293) q[2],q[0];
rzz(0.8646873580314447) q[4],q[3];
cx q[1],q[3];
z q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
