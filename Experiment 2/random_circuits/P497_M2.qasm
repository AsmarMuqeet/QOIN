OPENQASM 2.0;
include "qelib1.inc";
gate gate_P497 q0,q1,q2,q3,q4 { u2(3.841852358067928,4.128759386546073) q1; x q1; cu1(3.512774597811635) q2,q0; cz q0,q2; sdg q3; x q3; u3(3.61144218767161,3.6635861231721565,2.562783092140211) q4; sx q4; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P497 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
