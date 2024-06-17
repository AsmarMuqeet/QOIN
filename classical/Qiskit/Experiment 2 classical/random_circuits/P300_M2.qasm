OPENQASM 2.0;
include "qelib1.inc";
gate gate_P300 q0,q1,q2,q3,q4 { sxdg q0; x q1; cu3(1.7900352200693628,5.6968879874194425,4.889810092360822) q0,q1; u(1.2150327269380823,2.69702124057105,0.7023941057689704) q2; s q2; sx q3; sxdg q3; y q4; u1(2.4443677344238197) q4; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P300 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
