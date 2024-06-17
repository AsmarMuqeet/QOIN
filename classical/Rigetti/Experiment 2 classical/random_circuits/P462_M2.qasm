OPENQASM 2.0;
include "qelib1.inc";
gate gate_P462 q0,q1,q2,q3,q4 { p(4.411267718698839) q1; t q1; y q2; cu1(3.4727406098732816) q3,q0; u2(1.204826052043635,4.400939086536258) q0; x q0; t q3; swap q1,q3; t q4; cz q2,q4; u2(5.802162219644563,1.265726053008968) q2; rz(1.1560472934955657) q4; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P462 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
