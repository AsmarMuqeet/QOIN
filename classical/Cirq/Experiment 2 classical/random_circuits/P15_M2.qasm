OPENQASM 2.0;
include "qelib1.inc";
gate gate_P15 q0,q1,q2,q3,q4,q5,q6 { p(2.8179446562067345) q0; sx q1; sx q3; rzz(1.48760573967544) q2,q4; cswap q0,q1,q4; p(1.547302703176593) q5; swap q5,q3; u2(0.06865520405909076,5.746280227839541) q6; cu3(4.6462981374916525,4.724795845443965,1.1668972768369648) q6,q2; }
qreg q[7];
creg c[3];
cx q[1],q[2];
gate_P15 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
