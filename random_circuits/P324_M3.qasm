OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.3319417139787755) q1; cx q0,q1; h q1; }
gate gate_P324 q0,q1,q2,q3,q4 { ry(0.0052541119612638295) q1; tdg q1; rzx(1.3319417139787755) q2,q0; csx q2,q0; crx(0.3769465626131135) q4,q3; ry(3.776629782179496) q3; x q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P324 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
