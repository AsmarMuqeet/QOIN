OPENQASM 2.0;
include "qelib1.inc";
gate gate_P24 q0,q1,q2,q3,q4 { z q0; u1(2.8758105304597117) q0; rz(1.7703831055995687) q0; u2(1.2068389902754504,2.2324109536973573) q1; h q1; cz q2,q3; s q3; u1(0.9024288321023959) q3; id q4; cy q4,q2; csx q1,q4; p(5.813381150937354) q2; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P24 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
