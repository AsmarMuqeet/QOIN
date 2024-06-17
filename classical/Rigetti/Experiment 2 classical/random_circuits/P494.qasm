OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.5631189947257491) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
sdg q[0];
rx(4.915412135973141) q[1];
rzx(0.5631189947257491) q[1],q[0];
p(3.0041220524916676) q[2];
u2(0.1446486351986839,0.4751659883705351) q[2];
id q[3];
sx q[4];
cu1(1.5228618947547148) q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
