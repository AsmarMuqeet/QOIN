OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(3.6427989712120983,0.4891252154644885,-0.4891252154644885) q0; }
gate gate_P270 q0,q1,q2,q3,q4,q5,q6 { sxdg q0; x q0; r(3.6427989712120983,2.059921542259385) q2; ccx q3,q1,q4; x q1; csx q2,q3; z q4; crx(3.736992360383013) q5,q6; csx q5,q6; }
qreg q[7];
creg c[3];
cx q[2],q[0];
gate_P270 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
