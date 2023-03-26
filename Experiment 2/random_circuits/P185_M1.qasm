OPENQASM 2.0;
include "qelib1.inc";
gate gate_P185 q0,q1,q2,q3,q4,q5,q6 { z q1; rz(6.241954497964106) q2; cy q1,q2; z q3; ry(1.1897990537013448) q3; y q4; cu3(5.684215438855706,3.6668296066696007,4.468026742910043) q0,q5; x q0; sdg q5; rx(4.088728935950232) q6; cu1(0.4097660250293901) q6,q4; }
qreg q[7];
creg c[3];
cx q[1],q[0];
gate_P185 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
