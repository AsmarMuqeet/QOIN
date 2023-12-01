OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.5657012104929349) q1; cx q0,q1; h q1; }
gate gate_P965 q0,q1,q2,q3,q4 { t q1; h q1; rxx(2.156745878133892) q3,q0; csx q0,q3; tdg q3; rzx(1.5657012104929349) q2,q4; sxdg q2; rzz(5.387342459040072) q2,q1; h q4; csx q0,q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[4];
gate_P965 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
