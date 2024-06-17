OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.876959094936448) q1; cx q0,q1; h q1; }
gate ryy_139921317821216(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.008571163038409) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r(param0,param1) q0 { u3(5.39312952624984,1.0475949749177684,-1.0475949749177684) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.899799542366545) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P925 q0,q1,q2,q3,q4,q5,q6 { ryy(2.899799542366545) q1,q0; rx(2.4011933248729873) q0; rx(1.1681393861314373) q2; rz(1.4362194109889435) q3; r(5.39312952624984,2.618391301712665) q4; ccx q4,q3,q1; t q3; u1(1.3860225485978688) q5; ryy_139921317821216(4.008571163038409) q5,q2; rzx(4.876959094936448) q2,q0; csx q4,q5; sdg q6; t q6; cu1(1.562216120168615) q6,q1; }
qreg q[7];
creg c[3];
cx q[0],q[1];
gate_P925 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
