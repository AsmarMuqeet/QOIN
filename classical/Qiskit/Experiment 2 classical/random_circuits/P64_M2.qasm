OPENQASM 2.0;
include "qelib1.inc";
gate gate_P64 q0,q1,q2,q3,q4 { s q2; ccx q3,q0,q1; u2(0.7419837936779291,4.3966335352228745) q0; x q1; z q3; rz(0.7039277744297677) q4; cu3(6.157556184370507,4.388622791433297,1.1011485273310306) q4,q2; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[3];
gate_P64 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
