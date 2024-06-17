OPENQASM 2.0;
include "qelib1.inc";
gate gate_P691 q0,q1,q2,q3,q4 { tdg q2; u(4.659773759430842,6.075386473294986,0.9205942766768971) q2; cu3(3.166390492925852,5.275554666254686,3.2699698591946214) q1,q3; u1(1.200880769743682) q1; rz(1.7185799993353152) q3; csx q4,q0; rz(1.4476888188196817) q0; u2(1.103677480920375,4.458601842188233) q4; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P691 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];