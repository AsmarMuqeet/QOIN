OPENQASM 2.0;
include "qelib1.inc";
gate gate_P117 q0,q1,q2,q3,q4,q5,q6 { z q0; z q0; cy q1,q2; z q4; cx q4,q1; y q5; csx q2,q5; cry(1.7421075803185293) q3,q6; cu(1.9039085579086399,4.606658287593762,4.323484055164498,2.8184050876341167) q3,q6; }
qreg q[7];
creg c[3];
cx q[0],q[2];
gate_P117 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
