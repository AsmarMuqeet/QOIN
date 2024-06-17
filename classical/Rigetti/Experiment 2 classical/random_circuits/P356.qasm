OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.324818308896406) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
sdg q[0];
h q[1];
u1(6.0779762559273856) q[2];
cu3(3.831498024514102,2.94892766639495,4.8634884161856675) q[2],q[0];
rx(1.351678922433868) q[0];
swap q[3],q[4];
h q[3];
cp(4.214425557039123) q[4],q[1];
cx q[2],q[1];
ryy(1.324818308896406) q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
