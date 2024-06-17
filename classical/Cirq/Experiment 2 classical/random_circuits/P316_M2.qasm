OPENQASM 2.0;
include "qelib1.inc";
gate gate_P316 q0,q1,q2,q3,q4 { h q0; sxdg q2; h q3; csx q3,q2; cz q2,q3; rzz(0.020362588790866918) q4,q1; x q1; cu(0.6612034596548831,4.456763605513895,0.8919374036046953,0.43364998861469) q4,q0; cu1(3.3589947885690252) q1,q0; ry(4.653096911210419) q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P316 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
