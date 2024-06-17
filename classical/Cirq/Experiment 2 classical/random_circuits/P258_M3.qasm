OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.795877192468547) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P258 q0,q1,q2,q3,q4,q5,q6 { u(2.1622836753199217,6.0593826819926475,3.956288317874007) q2; cx q0,q3; y q0; sxdg q3; csx q4,q1; tdg q1; csx q4,q2; sdg q5; sx q6; ryy(5.795877192468547) q5,q6; }
qreg q[7];
creg c[3];
ccx q[2],q[1],q[3];
gate_P258 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
