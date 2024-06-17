OPENQASM 2.0;
include "qelib1.inc";
gate gate_P202 q0,q1,q2,q3,q4 { u3(3.6691378242949955,4.75180084569969,2.713709223100638) q2; u1(4.365807525284978) q2; rxx(0.028486734248339578) q3,q1; tdg q1; sx q3; swap q4,q0; cy q4,q0; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P202 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
