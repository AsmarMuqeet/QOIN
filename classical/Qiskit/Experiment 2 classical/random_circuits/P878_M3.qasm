OPENQASM 2.0;
include "qelib1.inc";
gate gate_P878 q0,q1,q2,q3,q4,q5,q6 { cp(0.18268409002982428) q0,q2; sxdg q2; u1(5.840614967073983) q3; cu1(0.8941602235399753) q0,q3; sdg q4; u(3.5805059336961707,0.425149546412958,4.589512222906218) q5; s q5; swap q1,q6; cu1(3.524101029541472) q1,q4; rz(4.253883566225575) q6; }
qreg q[7];
creg c[3];
cx q[0],q[1];
gate_P878 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
