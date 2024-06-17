OPENQASM 2.0;
include "qelib1.inc";
gate gate_P391 q0,q1,q2,q3,q4 { rx(5.811326304064823) q0; sx q1; p(2.5786478555473584) q2; id q2; cz q4,q3; cp(0.7053984087057901) q1,q3; cz q4,q0; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P391 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
