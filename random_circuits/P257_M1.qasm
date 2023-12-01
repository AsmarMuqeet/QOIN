OPENQASM 2.0;
include "qelib1.inc";
gate gate_P257 q0,q1,q2,q3,q4 { p(6.228881532553803) q2; y q2; sx q2; cu(2.173700864413773,1.9433489872844014,6.19662816903794,2.034957181486847) q3,q0; h q0; id q3; rzz(0.5268667521695247) q1,q4; sx q1; cp(2.839973750827139) q3,q1; rz(4.560672387560237) q4; swap q4,q0; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P257 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
