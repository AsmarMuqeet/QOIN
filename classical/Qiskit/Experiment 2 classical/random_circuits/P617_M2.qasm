OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.255868106739324) q1; cx q0,q1; h q1; }
gate gate_P617 q0,q1,q2,q3,q4 { u3(4.205917765477996,5.160251133112234,0.9038145057124154) q0; rx(3.5983150162705226) q0; h q2; x q2; tdg q3; t q3; rzz(4.775538760193917) q4,q1; rzx(5.255868106739324) q4,q1; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[3];
gate_P617 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
