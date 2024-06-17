OPENQASM 2.0;
include "qelib1.inc";
gate gate_P553 q0,q1,q2,q3,q4,q5,q6 { u2(5.5551725932740625,4.740738803760474) q0; ry(3.1596223724047574) q1; swap q1,q0; tdg q3; rz(4.79739118483351) q4; u(1.575445933252652,1.9201813879184533,5.771739932285293) q4; cswap q2,q5,q6; rx(3.930539214367256) q2; crz(1.3837220233201621) q3,q6; sx q5; }
qreg q[7];
creg c[3];
ccx q[2],q[0],q[1];
gate_P553 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
