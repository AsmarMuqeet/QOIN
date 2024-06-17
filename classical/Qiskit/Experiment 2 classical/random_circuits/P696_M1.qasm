OPENQASM 2.0;
include "qelib1.inc";
gate gate_P696 q0,q1,q2,q3,q4 { y q1; sx q2; rx(0.5935979348709283) q2; rzz(0.17718595031236634) q0,q3; cu3(4.155581328778422,4.072441868160796,3.7919701869441016) q0,q1; h q3; u2(4.0108559110319755,5.846676504174429) q4; t q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P696 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
