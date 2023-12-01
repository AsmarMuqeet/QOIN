OPENQASM 2.0;
include "qelib1.inc";
gate gate_P669 q0,q1,q2,q3,q4 { cu3(2.5807080675965945,1.1131644263213252,3.244961882760315) q0,q2; z q0; u3(1.570010763030945,4.827105493660059,1.856827841747175) q2; id q3; cx q1,q4; p(0.9094578503437974) q1; csx q4,q3; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P669 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
