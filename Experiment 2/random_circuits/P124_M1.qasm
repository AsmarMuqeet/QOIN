OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(1.6543493841086694,4.034666125208704,-4.034666125208704) q0; }
gate gate_P124 q0,q1,q2,q3,q4 { tdg q0; u1(1.7087366639474795) q2; sx q2; csx q3,q1; sxdg q1; cu(5.146250051349184,1.576835531624573,3.4432876066850193,3.4586760411613446) q2,q1; swap q3,q0; r(1.6543493841086694,5.605462452003601) q3; id q4; t q4; cy q0,q4; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P124 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
