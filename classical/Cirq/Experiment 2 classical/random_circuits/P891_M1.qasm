OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
gate r(param0,param1) q0 { u3(0.8772940765390462,-1.1550852672170018,1.1550852672170018) q0; }
gate gate_P891 q0,q1,q2,q3,q4 { sxdg q1; tdg q1; r(0.8772940765390462,0.41571105957789484) q1; y q2; t q2; u2(2.054102235397145,2.632184050759477) q3; x q3; cz q0,q4; z q0; cy q0,q2; sxdg q4; dcx q3,q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[4];
gate_P891 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
