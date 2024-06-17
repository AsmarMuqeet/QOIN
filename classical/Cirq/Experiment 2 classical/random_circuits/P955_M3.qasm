OPENQASM 2.0;
include "qelib1.inc";
gate gate_P955 q0,q1,q2,q3,q4,q5,q6 { x q0; tdg q1; cx q4,q5; rxx(2.1202794195112404) q1,q5; cswap q6,q3,q2; rx(4.684993670461126) q3; ccx q4,q2,q0; t q6; }
qreg q[7];
creg c[3];
ccx q[0],q[1],q[3];
gate_P955 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
