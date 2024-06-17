OPENQASM 2.0;
include "qelib1.inc";
gate gate_P436 q0,q1,q2,q3,q4 { cswap q0,q2,q3; rzz(4.363070316805533) q2,q3; cu(1.2200031644712095,2.389695503585663,4.796191498341862,5.356949675870498) q4,q1; cu1(3.03678855260352) q0,q1; cswap q2,q3,q0; x q4; cy q4,q1; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P436 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
