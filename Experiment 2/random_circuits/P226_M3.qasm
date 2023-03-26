OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.546029029712658) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P226 q0,q1,q2,q3,q4,q5,q6 { swap q0,q3; y q3; x q4; tdg q4; cx q1,q5; u(3.7567906918041203,3.4533670030586907,5.849257519165167) q1; ryy(5.546029029712658) q2,q6; rzz(5.59648171792595) q5,q2; cy q6,q0; }
qreg q[7];
creg c[3];
ccx q[1],q[2],q[0];
gate_P226 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
