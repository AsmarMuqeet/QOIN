OPENQASM 2.0;
include "qelib1.inc";
gate gate_P833 q0,q1,q2,q3,q4,q5,q6 { z q0; tdg q0; p(3.586255702054597) q1; u1(0.6396744429282113) q1; y q2; x q2; rccx q3,q4,q5; y q4; p(2.006427254407587) q5; id q6; crx(2.893902960191595) q6,q3; }
qreg q[7];
creg c[3];
ccx q[0],q[1],q[2];
gate_P833 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
