OPENQASM 2.0;
include "qelib1.inc";
gate xx_minus_yy(param0,param1) q0,q1 { rz(-4.2079902375254) q1; rz(-pi/2) q0; sx q0; rz(pi/2) q0; s q1; cx q0,q1; ry(1.4834859309888808) q0; ry(-1.4834859309888808) q1; cx q0,q1; sdg q1; rz(-pi/2) q0; sxdg q0; rz(pi/2) q0; rz(4.2079902375254) q1; }
gate gate_P733 q0,q1,q2,q3,q4,q5,q6 { sx q1; rxx(2.7343931493536577) q0,q4; cz q0,q1; cu3(2.390322016930046,2.8421873026966167,2.3909625101536163) q2,q5; tdg q2; ry(3.526514689180044) q5; cu(2.1425053421687075,3.3836722994902657,2.4195599547556927,5.470766401799064) q6,q3; s q3; xx_minus_yy(2.9669718619777616,4.2079902375254) q4,q6; }
qreg q[7];
creg c[3];
ccx q[0],q[1],q[2];
gate_P733 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
