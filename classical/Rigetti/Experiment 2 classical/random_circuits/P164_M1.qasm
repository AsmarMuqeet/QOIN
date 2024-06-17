OPENQASM 2.0;
include "qelib1.inc";
gate xx_minus_yy(param0,param1) q0,q1 { rz(-4.171733636872517) q1; rz(-pi/2) q0; sx q0; rz(pi/2) q0; s q1; cx q0,q1; ry(2.8419306612937993) q0; ry(-2.8419306612937993) q1; cx q0,q1; sdg q1; rz(-pi/2) q0; sxdg q0; rz(pi/2) q0; rz(4.171733636872517) q1; }
gate gate_P164 q0,q1,q2,q3,q4,q5,q6 { h q2; tdg q2; z q3; cu1(4.718811049079079) q0,q4; sx q0; xx_minus_yy(5.683861322587599,4.171733636872517) q4,q3; s q5; tdg q5; cz q6,q1; cz q1,q6; }
qreg q[7];
creg c[3];
ccx q[2],q[1],q[4];
gate_P164 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
