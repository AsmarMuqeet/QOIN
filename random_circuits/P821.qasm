OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.994345004352664) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
t q[0];
sdg q[2];
rx(5.458124488473015) q[2];
rxx(1.203366596110485) q[3],q[1];
rzx(5.994345004352664) q[1],q[0];
y q[4];
cu1(1.4260232710660146) q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
