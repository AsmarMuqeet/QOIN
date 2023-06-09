OPENQASM 2.0;
include "qelib1.inc";
gate xx_plus_yy(param0,param1) q0,q1 { rz(3.327442501957055) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-1.671696846039731) q1; ry(-1.671696846039731) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-3.327442501957055) q0; }
gate gate_P750 q0,q1,q2,q3,q4,q5,q6 { s q1; cu1(3.329674915076195) q4,q2; y q2; sxdg q4; rx(0.9760124957659579) q4; s q5; u1(5.809645833776801) q5; z q5; xx_plus_yy(3.343393692079462,3.327442501957055) q4,q5; ccx q0,q3,q6; cu1(3.1908464480537537) q1,q0; h q1; sdg q1; rx(5.390356499717265) q3; cu3(3.595390039194406,5.956341303673761,2.1288972777114736) q3,q0; h q6; cu3(6.193737991347627,0.5688871082301833,1.7116890925672603) q2,q6; u1(4.956562628742288) q2; ccx q3,q6,q0; }
qreg q[7];
creg c[3];
cx q[0],q[1];
gate_P750 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
