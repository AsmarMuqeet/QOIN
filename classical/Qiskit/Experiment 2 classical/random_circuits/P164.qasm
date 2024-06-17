OPENQASM 2.0;
include "qelib1.inc";
gate xx_minus_yy(param0,param1) q0,q1 { rz(-4.171733636872517) q1; rz(-pi/2) q0; sx q0; rz(pi/2) q0; s q1; cx q0,q1; ry(2.8419306612937993) q0; ry(-2.8419306612937993) q1; cx q0,q1; sdg q1; rz(-pi/2) q0; sxdg q0; rz(pi/2) q0; rz(4.171733636872517) q1; }
qreg q[7];
creg c[3];
h q[2];
tdg q[2];
z q[3];
cu1(4.718811049079079) q[0],q[4];
sx q[0];
xx_minus_yy(5.683861322587599,4.171733636872517) q[4],q[3];
s q[5];
tdg q[5];
cz q[6],q[1];
cz q[1],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
