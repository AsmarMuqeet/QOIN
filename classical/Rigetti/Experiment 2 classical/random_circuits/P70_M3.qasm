OPENQASM 2.0;
include "qelib1.inc";
gate gate_P70 q0,q1,q2,q3,q4 { u2(3.6341800446638493,4.368227842235155) q1; ry(4.48682614024372) q1; cx q0,q3; u1(3.3993388401710933) q0; cx q4,q2; u3(2.0663170230453365,4.573650719154792,1.7174211271755517) q2; csx q3,q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P70 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
