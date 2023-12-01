OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.48522934882758,1.9325261119066117,-1.9325261119066117) q0; }
gate gate_P384 q0,q1,q2,q3,q4 { csx q0,q1; sx q2; cswap q0,q2,q1; cx q0,q2; r(4.48522934882758,3.5033224387015083) q1; s q1; swap q2,q0; u(0.4976592811502432,1.872016698216485,0.9396794557929635) q3; u(5.786429106438583,3.8163450182073646,1.3568837558733289) q4; cx q3,q4; csx q3,q4; cy q4,q3; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P384 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
