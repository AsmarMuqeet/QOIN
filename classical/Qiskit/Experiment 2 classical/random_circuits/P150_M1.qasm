OPENQASM 2.0;
include "qelib1.inc";
gate gate_P150 q0,q1,q2,q3,q4,q5,q6 { p(5.213858950003423) q0; rx(3.080302319403861) q1; p(5.80647962781602) q2; csx q0,q2; t q2; tdg q3; cp(5.95874571730982) q3,q1; swap q0,q3; id q1; p(3.29191708240584) q4; id q5; sxdg q5; y q5; tdg q6; crz(3.423557563884373) q4,q6; h q4; u(2.8697791964738997,2.4706924582236702,5.154209840626764) q6; }
qreg q[7];
creg c[3];
cx q[1],q[2];
gate_P150 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
