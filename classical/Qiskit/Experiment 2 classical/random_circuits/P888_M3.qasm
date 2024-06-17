OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
gate gate_P888 q0,q1,q2,q3,q4,q5,q6 { id q2; s q2; ccx q4,q3,q1; z q3; cz q0,q5; cz q1,q0; dcx q4,q5; sdg q6; z q6; }
qreg q[7];
creg c[3];
ccx q[1],q[0],q[2];
gate_P888 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
