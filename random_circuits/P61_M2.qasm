OPENQASM 2.0;
include "qelib1.inc";
gate gate_P61 q0,q1,q2,q3,q4 { y q0; x q0; rz(2.359537001948015) q1; sx q1; h q2; p(4.973393254692775) q2; id q3; rx(6.116712399211394) q3; s q4; y q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P61 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
