OPENQASM 2.0;
include "qelib1.inc";
gate gate_P688 q0,q1,q2,q3,q4,q5,q6 { csx q2,q1; ry(5.827627521235936) q1; tdg q2; ry(2.324163311458492) q4; ry(2.0787222703133765) q4; cy q5,q0; rz(2.3537389113508196) q5; rzz(3.3608718546446017) q6,q3; cu1(0.593554916957232) q0,q3; t q6; }
qreg q[7];
creg c[3];
ccx q[2],q[0],q[4];
gate_P688 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
