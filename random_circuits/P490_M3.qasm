OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.248815352436934) q1; cx q0,q1; h q1; }
gate gate_P490 q0,q1,q2,q3,q4 { rzz(4.529762636583626) q1,q0; tdg q2; rz(3.545521217130086) q2; rx(2.3967085318575494) q2; rzx(3.248815352436934) q3,q4; swap q0,q4; sdg q0; rzz(3.7577360531332724) q1,q3; sxdg q1; x q3; p(2.5114234027473503) q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P490 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
