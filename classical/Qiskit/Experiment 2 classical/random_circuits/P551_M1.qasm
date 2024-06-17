OPENQASM 2.0;
include "qelib1.inc";
gate gate_P551 q0,q1,q2,q3,q4,q5,q6 { cx q0,q1; z q0; cp(4.494262167164054) q3,q2; sx q2; p(6.145251547745821) q3; rx(5.40246382292685) q4; h q4; sxdg q5; u(4.298507597883107,0.3093668214770608,2.7637645438399807) q5; rx(4.902690975348113) q6; rzz(4.13435459627747) q1,q6; }
qreg q[7];
creg c[3];
cx q[0],q[2];
gate_P551 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
