OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.29529943020813126) q1; cx q0,q1; h q1; }
gate gate_P454 q0,q1,q2,q3,q4,q5,q6 { s q0; csx q4,q1; u2(0.23103319645641693,6.127726839108221) q4; cswap q3,q5,q2; cy q1,q3; cz q2,q5; u2(2.5821476729502613,0.8999131453802415) q6; rzx(0.29529943020813126) q0,q6; }
qreg q[7];
creg c[3];
ccx q[0],q[2],q[1];
gate_P454 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
