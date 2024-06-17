OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
gate gate_P17 q0,q1,q2,q3,q4 { rzz(5.4800879019058675) q0,q1; s q1; rz(4.467006075068118) q2; cu3(3.780763694906341,2.121453841889495,3.0174856036756474) q2,q0; z q3; u3(2.0473625547460474,2.9914798373783045,2.3235887226087337) q4; dcx q4,q3; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P17 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
