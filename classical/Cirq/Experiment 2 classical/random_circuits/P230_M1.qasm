OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.805847276394867) q1; cx q0,q1; h q1; }
gate gate_P230 q0,q1,q2,q3,q4 { rz(3.7175225550790816) q0; tdg q2; rzz(5.782872982246366) q1,q3; cy q2,q1; u1(4.704074792632265) q3; u2(4.185946650113927,2.1789103507327896) q4; rzx(5.805847276394867) q4,q0; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P230 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
