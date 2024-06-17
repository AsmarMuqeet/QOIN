OPENQASM 2.0;
include "qelib1.inc";
gate gate_P457 q0,q1,q2,q3,q4 { sx q1; id q2; x q3; cswap q1,q2,q3; rz(1.8946312530116631) q1; u2(0.7204184669050362,5.78507054626995) q2; cz q4,q0; x q0; u1(0.7551926108260233) q0; u1(4.490207527726144) q4; cz q4,q3; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P457 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
