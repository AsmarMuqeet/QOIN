OPENQASM 2.0;
include "qelib1.inc";
gate gate_P333 q0,q1,q2,q3,q4 { z q1; cp(4.700625016733895) q0,q3; cu(4.343816373730643,3.1200117153789972,2.099096417983502,4.728603750017692) q1,q0; csx q2,q4; csx q2,q3; id q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[3];
gate_P333 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
