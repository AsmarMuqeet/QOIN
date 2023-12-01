OPENQASM 2.0;
include "qelib1.inc";
gate gate_P142 q0,q1,q2,q3,q4 { p(0.5888971734414324) q0; ry(0.7756321114617226) q0; id q0; t q3; cswap q2,q4,q1; csx q2,q1; ry(4.298488243656001) q1; x q1; cz q4,q3; cx q2,q4; u2(5.111522593146095,3.8473357145978704) q2; sx q3; cswap q0,q3,q4; cx q0,q1; cy q2,q4; u(5.334552379254792,6.097844910813695,2.818854685584165) q3; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P142 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
