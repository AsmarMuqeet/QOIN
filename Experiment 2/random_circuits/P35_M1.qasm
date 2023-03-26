OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
gate gate_P35 q0,q1,q2,q3,q4 { u1(3.9976349100583723) q0; rz(1.1775532787285075) q0; u3(2.1820381811021172,3.586165069270426,1.3339018114655399) q1; y q2; cu1(4.297198161915006) q1,q2; iswap q3,q4; sx q3; u2(0.25664470122091065,3.9952653583230493) q4; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[3];
gate_P35 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
