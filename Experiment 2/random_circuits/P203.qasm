OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.465458295821298) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
rzz(1.419626599822809) q[2],q[3];
t q[2];
tdg q[3];
ccx q[0],q[1],q[4];
ryy(5.465458295821298) q[0],q[4];
sdg q[1];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
