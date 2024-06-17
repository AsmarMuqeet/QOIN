OPENQASM 2.0;
include "qelib1.inc";
gate gate_P818 q0,q1,q2,q3,q4 { h q0; u3(4.304200161884992,6.071369256661041,2.882224992312495) q2; rx(3.406109811974661) q2; sxdg q3; h q3; cz q1,q4; cu3(0.18792789218910233,5.617988593356196,1.8140527215779734) q0,q4; sxdg q1; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[3];
gate_P818 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
