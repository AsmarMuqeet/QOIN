OPENQASM 2.0;
include "qelib1.inc";
gate gate_P136 q0,q1,q2,q3,q4,q5,q6 { ry(0.9243436521272331) q0; u1(2.3524843933343993) q1; id q2; z q3; y q3; csx q4,q5; ccx q2,q5,q0; id q6; ccx q6,q1,q4; }
qreg q[7];
creg c[3];
ccx q[1],q[2],q[4];
gate_P136 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
