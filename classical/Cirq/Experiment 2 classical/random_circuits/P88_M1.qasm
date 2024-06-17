OPENQASM 2.0;
include "qelib1.inc";
gate gate_P88 q0,q1,q2,q3,q4 { u2(2.295109104790517,2.1361664035906682) q0; s q0; ccx q1,q3,q2; s q2; cp(2.094629957414727) q3,q1; rz(4.053217901626095) q4; u3(0.7185525399739883,2.5017249428748465,0.2546447776561009) q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[3];
gate_P88 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
