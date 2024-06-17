OPENQASM 2.0;
include "qelib1.inc";
gate ryy_139921315372048(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(6.188376219231654) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.03581647041319833) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P501 q0,q1,q2,q3,q4 { sdg q0; tdg q0; ry(2.375257499796593) q2; s q2; s q3; ryy(0.03581647041319833) q1,q4; ryy_139921315372048(6.188376219231654) q3,q1; y q4; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[4];
gate_P501 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
