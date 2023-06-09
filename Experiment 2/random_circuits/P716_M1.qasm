OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(5.701454535969772,1.2913942107893384,-1.2913942107893384) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.023284476769827) q1; cx q0,q1; h q1; }
gate gate_P716 q0,q1,q2,q3,q4,q5,q6 { u3(5.2548985416432705,4.397665763127875,2.288756166180039) q0; u3(3.0627262527495316,5.115309616180503,5.099593419333711) q1; rzz(0.31587924114292293) q1,q0; z q3; rzx(5.023284476769827) q2,q4; cx q2,q4; cy q5,q6; ch q3,q5; r(5.701454535969772,2.862190537584235) q6; }
qreg q[7];
creg c[3];
ccx q[0],q[1],q[3];
gate_P716 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
