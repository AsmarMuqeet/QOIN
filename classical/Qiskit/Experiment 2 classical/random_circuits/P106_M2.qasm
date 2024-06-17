OPENQASM 2.0;
include "qelib1.inc";
gate gate_P106 q0,q1,q2,q3,q4 { cx q1,q2; cz q1,q2; rz(2.542232055490084) q3; p(1.7077788705876136) q3; cu1(0.9487230833454432) q4,q0; t q0; sx q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P106 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
