OPENQASM 2.0;
include "qelib1.inc";
gate gate_P945 q0,q1,q2,q3,q4 { ry(5.043891584902536) q1; u1(1.5955641538905991) q1; rzz(5.695137046697842) q2,q0; z q2; cx q3,q4; csx q0,q3; p(1.0472697351667801) q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P945 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
