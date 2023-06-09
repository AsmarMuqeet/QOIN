OPENQASM 2.0;
include "qelib1.inc";
gate gate_P43 q0,q1,q2,q3,q4,q5,q6 { p(1.9458955826265323) q0; y q0; cp(1.8134744848356348) q3,q1; rx(5.180614742166469) q1; cu(6.163125039209908,2.2283613745862643,1.480105135141316,2.142486889953815) q5,q2; cu1(3.246553322654629) q3,q2; rz(5.050829655373363) q5; cry(1.4032144904319854) q6,q4; crz(0.2209245572667436) q6,q4; }
qreg q[7];
creg c[3];
cx q[0],q[2];
gate_P43 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
