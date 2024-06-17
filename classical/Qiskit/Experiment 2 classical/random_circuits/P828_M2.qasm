OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.605957741798149) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P828 q0,q1,q2,q3,q4 { rz(0.6624768204590062) q0; tdg q1; ryy(5.605957741798149) q2,q3; ry(1.7755267045694356) q2; cu1(1.9257686468771547) q3,q0; t q4; cz q1,q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[3];
gate_P828 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
