OPENQASM 2.0;
include "qelib1.inc";
gate gate_P728 q0,q1,q2,q3,q4,q5,q6 { rxx(1.458980083428582) q3,q1; tdg q1; z q3; csx q0,q4; rx(1.379026713517897) q0; y q5; id q5; cp(3.415981438565862) q2,q6; cu(1.8622185820792618,5.529522268961063,2.941536646173118,3.3593448514193374) q2,q4; sdg q6; }
qreg q[7];
creg c[3];
ccx q[0],q[2],q[1];
gate_P728 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
