OPENQASM 2.0;
include "qelib1.inc";
gate gate_P571 q0,q1,q2,q3,q4 { cz q1,q0; tdg q2; u1(5.192601891049608) q2; rzz(5.3193576305172225) q3,q4; rxx(3.779466204561407) q0,q3; csx q4,q1; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[3];
gate_P571 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
