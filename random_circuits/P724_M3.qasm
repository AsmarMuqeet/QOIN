OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.4391561229856284) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r(param0,param1) q0 { u3(1.6116872471200323,1.9298196491584232,-1.9298196491584232) q0; }
gate gate_P724 q0,q1,q2,q3,q4,q5,q6 { h q1; sdg q1; h q2; r(1.6116872471200323,3.5006159759533197) q3; sxdg q4; tdg q4; csx q5,q0; ry(5.090057410019487) q0; cu1(2.8156695732641226) q3,q5; u2(1.6496045687468395,0.36160030159156686) q6; ryy(4.4391561229856284) q2,q6; }
qreg q[7];
creg c[3];
ccx q[0],q[1],q[2];
gate_P724 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
