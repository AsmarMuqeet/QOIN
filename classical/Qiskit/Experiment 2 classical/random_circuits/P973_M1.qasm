OPENQASM 2.0;
include "qelib1.inc";
gate gate_P973 q0,q1,q2,q3,q4,q5,q6 { y q0; rz(4.053285596050525) q0; sxdg q1; rx(4.303732987945518) q3; sx q3; cu1(1.8630535086107098) q4,q2; z q2; h q4; tdg q5; sx q6; cswap q5,q1,q6; }
qreg q[7];
creg c[3];
ccx q[1],q[2],q[3];
gate_P973 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
