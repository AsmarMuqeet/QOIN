OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.7237722541017846) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P994 q0,q1,q2,q3,q4 { sdg q0; y q0; x q0; cz q2,q1; sdg q2; cy q3,q4; cp(3.3436914090118703) q1,q4; ryy(1.7237722541017846) q2,q1; u(4.103557258536342,3.516381023781349,1.6852027962515448) q3; csx q4,q3; cswap q3,q2,q1; cz q4,q0; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P994 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
