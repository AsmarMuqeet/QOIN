OPENQASM 2.0;
include "qelib1.inc";
gate xx_minus_yy(param0,param1) q0,q1 { rz(-2.9675704683799) q1; rz(-pi/2) q0; sx q0; rz(pi/2) q0; s q1; cx q0,q1; ry(3.1106636739577946) q0; ry(-3.1106636739577946) q1; cx q0,q1; sdg q1; rz(-pi/2) q0; sxdg q0; rz(pi/2) q0; rz(2.9675704683799) q1; }
gate gate_P946 q0,q1,q2,q3,q4,q5,q6 { x q0; sdg q0; x q2; tdg q4; swap q1,q5; cu3(1.9156902915653131,3.5396863836515364,3.925161242761904) q1,q4; rxx(4.184594511540166) q5,q2; xx_minus_yy(6.221327347915589,2.9675704683799) q6,q3; cu(2.113474659316916,2.471021963620264,0.4985937678833828,0.32369866376129786) q6,q3; }
qreg q[7];
creg c[3];
cx q[0],q[1];
gate_P946 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
