OPENQASM 2.0;
include "qelib1.inc";
gate gate_P359 q0,q1,q2,q3,q4,q5,q6 { u1(1.088761721368808) q1; cy q0,q2; u2(6.001899212207426,0.7788745696461811) q3; cu(1.5979414457864423,2.714876674058555,1.959104352491384,2.9983700761402816) q3,q2; sdg q4; tdg q4; sx q5; t q5; rx(2.682789080745562) q6; ccx q6,q0,q1; }
qreg q[7];
creg c[3];
ccx q[1],q[2],q[4];
gate_P359 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
