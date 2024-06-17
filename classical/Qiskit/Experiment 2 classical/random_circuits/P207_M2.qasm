OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.2217224459746994) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P207 q0,q1,q2,q3,q4,q5,q6 { cswap q2,q0,q3; h q4; cx q1,q5; swap q1,q3; ryy(1.2217224459746994) q2,q5; ry(3.142387084628769) q6; cswap q4,q6,q0; }
qreg q[7];
creg c[3];
cx q[0],q[2];
gate_P207 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
