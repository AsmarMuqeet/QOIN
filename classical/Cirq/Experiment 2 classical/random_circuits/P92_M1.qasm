OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.439002566626554) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P92 q0,q1,q2,q3,q4 { sdg q1; cswap q3,q2,q0; cu3(2.860420871564597,4.1011863973077265,3.9654263312949767) q0,q2; u3(5.009871262567922,2.072418578148213,2.3508999393372156) q0; ryy(3.439002566626554) q1,q3; cy q2,q1; x q3; z q4; tdg q4; h q4; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[3];
gate_P92 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
