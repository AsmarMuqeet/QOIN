OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.509111538784173) q1; cx q0,q1; h q1; }
gate gate_P978 q0,q1,q2,q3,q4 { sdg q0; z q3; cswap q1,q4,q2; rxx(4.04241560957484) q2,q1; cswap q3,q4,q0; cz q2,q0; ry(5.053305385785287) q2; id q3; cz q4,q1; cu3(0.7101987751572763,3.6646708282426985,4.841429349556056) q0,q4; swap q3,q1; tdg q1; cx q3,q0; rzx(3.509111538784173) q4,q2; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P978 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
