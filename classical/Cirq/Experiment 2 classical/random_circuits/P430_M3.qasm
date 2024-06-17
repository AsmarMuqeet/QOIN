OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.49729294205928) q1; cx q0,q1; h q1; }
gate gate_P430 q0,q1,q2,q3,q4 { t q1; h q1; h q1; cswap q2,q0,q3; rzx(5.49729294205928) q0,q2; sxdg q0; rz(3.8687197234598334) q2; sx q4; rzz(5.165683576327213) q4,q3; sx q3; rx(4.234575934031972) q4; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[3];
gate_P430 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
