OPENQASM 2.0;
include "qelib1.inc";
gate gate_P678 q0,q1,q2,q3,q4,q5,q6 { ccx q0,q3,q1; cx q1,q0; csx q4,q5; t q4; cry(3.0698096698649486) q5,q3; cz q6,q2; cz q6,q2; }
qreg q[7];
creg c[3];
cx q[1],q[2];
gate_P678 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
