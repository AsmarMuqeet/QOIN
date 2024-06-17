OPENQASM 2.0;
include "qelib1.inc";
gate gate_P792 q0,q1,q2,q3,q4 { sxdg q0; rx(1.8137474587799791) q1; y q1; sxdg q3; h q3; s q3; csx q2,q4; cz q0,q4; cx q1,q0; y q2; u1(2.428440211637775) q2; h q4; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[4];
gate_P792 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
