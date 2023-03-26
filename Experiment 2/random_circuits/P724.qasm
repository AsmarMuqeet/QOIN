OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(1.6116872471200323,1.9298196491584232,-1.9298196491584232) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.4391561229856284) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
h q[1];
sdg q[1];
h q[2];
r(1.6116872471200323,3.5006159759533197) q[3];
sxdg q[4];
tdg q[4];
csx q[5],q[0];
ry(5.090057410019487) q[0];
cu1(2.8156695732641226) q[3],q[5];
u2(1.6496045687468395,0.36160030159156686) q[6];
ryy(4.4391561229856284) q[2],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
