OPENQASM 2.0;
include "qelib1.inc";
gate gate_P183 q0,q1,q2,q3,q4 { sdg q1; tdg q1; csx q2,q3; cp(2.533164303314584) q4,q0; cx q0,q3; rxx(1.0700014879462811) q4,q2; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P183 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
