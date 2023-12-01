OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
gate gate_P99 q0,q1,q2,q3,q4,q5,q6 { u2(5.015544554682789,0.4218810287728603) q0; rz(5.517977677071876) q0; y q2; cx q1,q4; rxx(0.3181571282564244) q1,q2; rxx(0.40925938036252574) q3,q5; h q3; y q5; u1(2.659134033432518) q6; iswap q6,q4; }
qreg q[7];
creg c[3];
ccx q[1],q[0],q[2];
gate_P99 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
