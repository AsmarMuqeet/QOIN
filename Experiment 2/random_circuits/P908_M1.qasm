OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.701550392435085) q1; cx q0,q1; h q1; }
gate gate_P908 q0,q1,q2,q3,q4 { sdg q0; tdg q1; ry(1.0526070473047262) q1; p(4.00963643572214) q2; rzx(5.701550392435085) q0,q2; rz(5.004809387851271) q3; s q3; sxdg q4; z q4; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[2];
gate_P908 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
