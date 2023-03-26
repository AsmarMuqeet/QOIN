OPENQASM 2.0;
include "qelib1.inc";
gate gate_P741 q0,q1,q2,q3,q4 { z q0; cz q1,q2; cu1(0.8007726079069277) q0,q1; sxdg q2; cu3(5.26612737594329,4.46616642540026,1.6550482310984127) q4,q3; u2(1.5345159541527154,1.128745867176819) q3; x q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P741 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
