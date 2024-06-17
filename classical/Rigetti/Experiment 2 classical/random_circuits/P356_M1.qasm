OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.324818308896406) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P356 q0,q1,q2,q3,q4 { sdg q0; h q1; u1(6.0779762559273856) q2; cu3(3.831498024514102,2.94892766639495,4.8634884161856675) q2,q0; rx(1.351678922433868) q0; swap q3,q4; h q3; cp(4.214425557039123) q4,q1; cx q2,q1; ryy(1.324818308896406) q3,q4; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P356 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
