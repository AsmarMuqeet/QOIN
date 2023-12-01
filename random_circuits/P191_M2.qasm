OPENQASM 2.0;
include "qelib1.inc";
gate gate_P191 q0,q1,q2,q3,q4 { tdg q0; h q0; z q2; id q2; cswap q1,q3,q4; cu1(5.037906367629519) q1,q3; z q4; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[2];
gate_P191 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
