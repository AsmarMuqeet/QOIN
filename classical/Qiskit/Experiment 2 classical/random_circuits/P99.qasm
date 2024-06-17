OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
qreg q[7];
creg c[3];
u2(5.015544554682789,0.4218810287728603) q[0];
rz(5.517977677071876) q[0];
y q[2];
cx q[1],q[4];
rxx(0.3181571282564244) q[1],q[2];
rxx(0.40925938036252574) q[3],q[5];
h q[3];
y q[5];
u1(2.659134033432518) q[6];
iswap q[6],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
