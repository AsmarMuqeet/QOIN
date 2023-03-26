OPENQASM 2.0;
include "qelib1.inc";
gate gate_P524 q0,q1,q2,q3,q4 { sxdg q0; ry(5.5133574666157275) q0; tdg q2; u2(2.473153043624538,1.9414207143672684) q2; csx q1,q3; sx q1; u1(0.012179871888300635) q3; id q4; h q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P524 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
