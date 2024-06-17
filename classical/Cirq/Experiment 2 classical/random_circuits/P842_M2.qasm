OPENQASM 2.0;
include "qelib1.inc";
gate gate_P842 q0,q1,q2,q3,q4,q5,q6 { sxdg q0; h q0; sxdg q1; u1(4.915880605235506) q2; h q2; sx q4; cu1(1.6089704207887368) q5,q3; cz q4,q3; x q5; t q6; swap q6,q1; }
qreg q[7];
creg c[3];
ccx q[2],q[0],q[1];
gate_P842 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
