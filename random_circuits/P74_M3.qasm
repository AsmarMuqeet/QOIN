OPENQASM 2.0;
include "qelib1.inc";
gate gate_P74 q0,q1,q2,q3,q4 { cu1(0.16195511060276382) q2,q3; ccx q1,q0,q4; cu3(4.057231619404924,5.544038330312545,0.09500713396519948) q0,q2; rz(0.15590655508654305) q1; cx q3,q4; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[0];
gate_P74 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
