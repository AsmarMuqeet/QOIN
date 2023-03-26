OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.5631189947257491) q1; cx q0,q1; h q1; }
gate gate_P494 q0,q1,q2,q3,q4 { sdg q0; rx(4.915412135973141) q1; rzx(0.5631189947257491) q1,q0; p(3.0041220524916676) q2; u2(0.1446486351986839,0.4751659883705351) q2; id q3; sx q4; cu1(1.5228618947547148) q4,q3; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P494 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
