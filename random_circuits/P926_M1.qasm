OPENQASM 2.0;
include "qelib1.inc";
gate gate_P926 q0,q1,q2,q3,q4 { sx q1; s q1; z q2; cswap q3,q0,q4; cp(0.010461969850206289) q3,q2; cu3(0.24527523226195952,1.4451530729564974,3.1051283312542384) q4,q0; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P926 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
