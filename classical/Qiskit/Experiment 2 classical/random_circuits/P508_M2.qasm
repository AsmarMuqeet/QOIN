OPENQASM 2.0;
include "qelib1.inc";
gate gate_P508 q0,q1,q2,q3,q4 { s q0; s q2; u(4.106928173574018,6.17897791135761,1.1396350310200158) q2; rxx(1.1065688120690513) q1,q3; swap q0,q3; u3(4.014245319423401,3.8596435753418494,6.174396370654622) q1; z q4; y q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P508 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
