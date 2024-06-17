OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.248815352436934) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
rzz(4.529762636583626) q[1],q[0];
tdg q[2];
rz(3.545521217130086) q[2];
rx(2.3967085318575494) q[2];
rzx(3.248815352436934) q[3],q[4];
swap q[0],q[4];
sdg q[0];
rzz(3.7577360531332724) q[1],q[3];
sxdg q[1];
x q[3];
p(2.5114234027473503) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
