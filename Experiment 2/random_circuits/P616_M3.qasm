OPENQASM 2.0;
include "qelib1.inc";
gate gate_P616 q0,q1,q2,q3,q4 { h q1; cx q0,q2; ccx q0,q1,q2; u3(2.5912205279024882,4.903381891088583,1.1868179809744626) q3; y q4; cx q3,q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P616 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
