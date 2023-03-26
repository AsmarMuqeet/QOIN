OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.3577957396791034) q1; cx q0,q1; h q1; }
gate gate_P825 q0,q1,q2,q3,q4 { x q0; h q0; sx q1; tdg q1; p(2.6850609251129542) q2; u1(2.748795736549403) q2; rzx(1.3577957396791034) q3,q4; ry(1.141521546953513) q3; y q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P825 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
