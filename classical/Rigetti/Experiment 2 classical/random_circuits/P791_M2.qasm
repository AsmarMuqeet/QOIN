OPENQASM 2.0;
include "qelib1.inc";
gate gate_P791 q0,q1,q2,q3,q4,q5,q6 { cz q1,q2; ry(3.710386897375431) q1; x q1; cp(0.200786994868493) q3,q0; rx(4.870437202563981) q0; rx(0.8552338065408766) q0; h q4; cp(5.45992029922136) q2,q4; sxdg q2; cx q5,q6; cz q3,q6; crx(2.856586151222417) q3,q4; x q5; u3(0.6268009571024288,4.793487015907671,2.6055843393268803) q5; s q6; }
qreg q[7];
creg c[3];
ccx q[2],q[0],q[3];
gate_P791 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
