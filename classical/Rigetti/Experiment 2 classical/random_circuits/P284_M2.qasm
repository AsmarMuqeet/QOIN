OPENQASM 2.0;
include "qelib1.inc";
gate gate_P284 q0,q1,q2,q3,q4 { u1(3.3482882241987895) q1; t q1; h q2; u1(3.735445691424041) q2; rxx(2.7033448854799955) q0,q3; x q0; t q4; cu(1.2759417851299195,3.659505660885604,0.7220860743908281,3.240480809701543) q4,q3; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[1];
gate_P284 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
