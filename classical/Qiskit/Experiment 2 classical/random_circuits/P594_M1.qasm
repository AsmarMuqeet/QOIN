OPENQASM 2.0;
include "qelib1.inc";
gate gate_P594 q0,q1,q2,q3,q4,q5,q6 { cp(6.263290313344781) q2,q1; id q1; s q3; rxx(3.2673386888092106) q3,q2; cu(2.4054220142948495,5.909288529711675,0.3446882770230117,0.03740868372708886) q4,q0; sxdg q0; rx(3.6532375008608593) q4; id q5; y q5; h q6; rz(5.616908264898076) q6; }
qreg q[7];
creg c[3];
cx q[1],q[2];
gate_P594 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
