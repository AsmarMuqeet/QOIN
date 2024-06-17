OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.6862737671886613) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P109 q0,q1,q2,q3,q4 { ccx q1,q0,q2; p(3.7717080359252693) q1; cz q3,q4; rxx(3.0698006603745003) q0,q4; cp(0.4886508001740852) q3,q2; csx q0,q3; ryy(0.6862737671886613) q2,q1; u2(4.53318423782322,6.024355043978994) q4; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P109 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
