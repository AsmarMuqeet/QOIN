OPENQASM 2.0;
include "qelib1.inc";
gate gate_P243 q0,q1,q2,q3,q4,q5,q6 { y q0; tdg q1; x q1; tdg q3; rx(6.000685530130455) q3; sx q4; p(2.858537443627102) q4; u(5.272950461794108,1.1386441925989703,2.500418901205035) q5; sx q5; cu3(6.016286000244259,2.310380774938491,2.434731288373474) q2,q6; ccx q2,q0,q6; }
qreg q[7];
creg c[3];
cx q[2],q[1];
gate_P243 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
