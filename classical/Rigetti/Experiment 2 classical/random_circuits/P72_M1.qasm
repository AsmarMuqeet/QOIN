OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.8372848150461868,0.1622065802931416,-0.1622065802931416) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.27162439727880977) q1; cx q0,q1; h q1; }
gate gate_P72 q0,q1,q2,q3,q4,q5,q6 { rzx(0.27162439727880977) q0,q1; h q0; id q1; rx(0.9402103567233048) q2; ry(4.192347479061059) q2; r(0.8372848150461868,1.7330029070880382) q4; t q5; rzz(1.9756999989628699) q3,q6; cswap q3,q5,q4; u1(1.8638649343324862) q6; }
qreg q[7];
creg c[3];
ccx q[0],q[1],q[2];
gate_P72 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
