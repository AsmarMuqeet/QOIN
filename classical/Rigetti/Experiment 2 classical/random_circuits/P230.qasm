OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.805847276394867) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
rz(3.7175225550790816) q[0];
tdg q[2];
rzz(5.782872982246366) q[1],q[3];
cy q[2],q[1];
u1(4.704074792632265) q[3];
u2(4.185946650113927,2.1789103507327896) q[4];
rzx(5.805847276394867) q[4],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
