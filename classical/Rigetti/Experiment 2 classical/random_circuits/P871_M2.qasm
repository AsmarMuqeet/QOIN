OPENQASM 2.0;
include "qelib1.inc";
gate gate_P871 q0,q1,q2,q3,q4,q5,q6 { u1(2.631549796352582) q2; y q2; ccx q1,q4,q0; t q0; u1(1.9922882003187345) q1; ch q3,q5; csx q4,q3; ry(2.6732379467360734) q5; sx q6; p(5.2491767918892345) q6; }
qreg q[7];
creg c[3];
ccx q[0],q[2],q[3];
gate_P871 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
