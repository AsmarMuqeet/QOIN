OPENQASM 2.0;
include "qelib1.inc";
gate gate_P611 q0,q1,q2,q3,q4 { csx q2,q0; s q0; x q2; t q3; u2(5.504014344291135,0.4078009259899307) q3; swap q1,q4; sx q1; t q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[1];
gate_P611 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
