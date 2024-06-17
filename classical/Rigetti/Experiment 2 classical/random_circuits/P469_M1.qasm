OPENQASM 2.0;
include "qelib1.inc";
gate r_139921315417920(param0,param1) q0 { u3(0.22599104328506822,3.274100651456016,-3.274100651456016) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.03433738452377) q1; cx q0,q1; h q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.65491141437437) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r_139921353551248(param0,param1) q0 { u3(3.4790206668969827,3.832887369445708,-3.832887369445708) q0; }
gate r_139921317124896(param0,param1) q0 { u3(5.492704811655221,3.4908536540680206,-3.4908536540680206) q0; }
gate r_139921353551296(param0,param1) q0 { u3(3.429666390629694,1.462256366136308,-1.462256366136308) q0; }
gate r(param0,param1) q0 { u3(2.344107130406386,1.0458236395250213,-1.0458236395250213) q0; }
gate gate_P469 q0,q1,q2,q3,q4 { sxdg q0; rx(6.066139087344382) q1; r(2.344107130406386,2.616619966319918) q3; cswap q3,q0,q1; r_139921353551296(3.429666390629694,3.0330526929312045) q1; swap q4,q2; ry(3.320690358062725) q2; swap q2,q0; id q2; r_139921317124896(5.492704811655221,5.061649980862917) q2; h q2; r_139921353551248(3.4790206668969827,5.403683696240605) q4; ryy(0.65491141437437) q3,q4; rzx(5.03433738452377) q3,q1; r_139921315417920(0.22599104328506822,4.844896978250913) q3; cp(4.947779130877242) q4,q0; cu1(1.9841083238203503) q1,q0; id q0; u2(3.5979025560411175,2.026192833070407) q0; s q4; ccx q1,q3,q4; rxx(1.7239224190221512) q1,q2; x q3; sdg q4; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P469 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];