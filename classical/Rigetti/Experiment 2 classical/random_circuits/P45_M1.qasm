OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.178611534025374) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P45 q0,q1,q2,q3,q4,q5,q6 { ryy(4.178611534025374) q3,q4; u1(2.1306781492272533) q4; cx q5,q2; ry(2.346254914087283) q2; cy q5,q3; ccx q0,q6,q1; rz(4.931454986082784) q0; cu(5.1734603638607215,2.652563979803628,1.201060279523031,4.7881871908224785) q6,q1; }
qreg q[7];
creg c[3];
cx q[0],q[2];
gate_P45 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
