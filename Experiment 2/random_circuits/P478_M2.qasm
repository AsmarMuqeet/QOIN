OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.742057159700106) q1; cx q0,q1; h q1; }
gate gate_P478 q0,q1,q2,q3,q4 { rzx(5.742057159700106) q0,q1; ry(5.808246049451483) q2; cz q2,q0; cu3(0.7021361046165562,0.2711801312249093,1.5941218216257844) q4,q3; rxx(6.005323647166927) q1,q4; sx q3; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P478 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
