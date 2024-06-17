OPENQASM 2.0;
include "qelib1.inc";
gate gate_P188 q0,q1,q2,q3,q4 { p(3.668088762656314) q0; u(2.2156442890378143,5.273911458376593,2.9965739970629) q0; id q1; h q1; cu(5.4341658886390665,4.197582312330893,2.2994048304560373,1.051858623353321) q3,q2; tdg q2; sx q3; x q4; t q4; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[3];
gate_P188 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
