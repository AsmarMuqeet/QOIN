OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.2313495958109293) q1; cx q0,q1; h q1; }
gate gate_P853 q0,q1,q2,q3,q4 { rxx(5.291568060527582) q1,q0; u(0.7785470371815558,0.7126102219550476,3.615077239937977) q2; rzx(0.2313495958109293) q2,q0; rzz(0.8646873580314447) q4,q3; cx q1,q3; z q4; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[3];
gate_P853 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
