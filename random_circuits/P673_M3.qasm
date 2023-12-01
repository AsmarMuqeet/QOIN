OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
gate gate_P673 q0,q1,q2,q3,q4,q5,q6 { u2(2.5070191958140446,5.70745364025067) q1; swap q2,q0; rx(4.284922797401093) q2; cswap q3,q4,q5; cz q0,q5; rxx(3.0876824610812865) q3,q1; ry(3.3378799518837874) q6; dcx q4,q6; }
qreg q[7];
creg c[3];
cx q[0],q[2];
gate_P673 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
