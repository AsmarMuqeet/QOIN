OPENQASM 2.0;
include "qelib1.inc";
gate gate_P434 q0,q1,q2,q3,q4 { cswap q0,q2,q1; rx(1.7273615524545614) q2; u1(1.133288451337508) q3; cu3(1.1961487940226485,2.5045079021900194,2.983975938812216) q3,q0; h q4; cz q4,q1; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P434 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
