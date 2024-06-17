OPENQASM 2.0;
include "qelib1.inc";
gate gate_P625 q0,q1,q2,q3,q4,q5,q6 { sxdg q0; h q2; cz q2,q0; cu(5.157516490120772,5.7005180831754,1.9392814239208191,4.291525519407582) q1,q3; x q1; s q3; rccx q5,q4,q6; x q4; id q5; tdg q6; }
qreg q[7];
creg c[3];
cx q[0],q[1];
gate_P625 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
