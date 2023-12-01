OPENQASM 2.0;
include "qelib1.inc";
gate ryy_139921316983328(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.55233330466446) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r(param0,param1) q0 { u3(2.998731526709587,-0.20502469726645223,0.20502469726645223) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.1055427800727866) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P329 q0,q1,q2,q3,q4 { u2(5.746636191401136,5.151708808453844) q0; cu(1.2096776291056768,6.099290105972669,5.085418352958782,0.6421679079799965) q1,q2; x q1; sdg q3; cswap q2,q0,q3; x q0; ryy(3.1055427800727866) q3,q2; swap q3,q0; ry(5.743098805665278) q0; t q3; x q4; r(2.998731526709587,1.3657716295284443) q4; csx q4,q1; t q1; cz q2,q4; s q2; ryy_139921316983328(3.55233330466446) q4,q1; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[3];
gate_P329 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
