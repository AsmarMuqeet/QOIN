OPENQASM 2.0;
include "qelib1.inc";
gate gate_P275 q0,q1,q2,q3,q4 { u1(0.11990599142882752) q1; cu1(2.877848073788984) q3,q2; u(2.886298867241224,1.0342440666704997,1.5186836776710602) q3; csx q4,q0; ccx q0,q2,q1; t q4; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P275 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
