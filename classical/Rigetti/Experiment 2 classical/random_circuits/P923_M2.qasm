OPENQASM 2.0;
include "qelib1.inc";
gate gate_P923 q0,q1,q2,q3,q4 { csx q0,q2; u(5.537883939956064,3.065074225120419,1.7219001637915896) q0; rx(2.8176739689295887) q2; sxdg q3; swap q1,q4; y q1; crz(3.288203457260626) q3,q4; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P923 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
