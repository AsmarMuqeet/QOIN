OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.465458295821298) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P203 q0,q1,q2,q3,q4 { rzz(1.419626599822809) q2,q3; t q2; tdg q3; ccx q0,q1,q4; ryy(5.465458295821298) q0,q4; sdg q1; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P203 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
