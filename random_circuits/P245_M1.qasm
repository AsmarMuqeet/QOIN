OPENQASM 2.0;
include "qelib1.inc";
gate gate_P245 q0,q1,q2,q3,q4,q5,q6 { u2(2.8559704318794465,3.1553903723540966) q0; y q0; tdg q1; h q2; x q2; rz(4.7858650267413925) q3; p(3.9757879556941353) q3; s q4; s q4; rz(2.077764607545214) q5; sx q5; id q6; rxx(1.1995657833657398) q1,q6; }
qreg q[7];
creg c[3];
ccx q[2],q[1],q[0];
gate_P245 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
