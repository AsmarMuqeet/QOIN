OPENQASM 2.0;
include "qelib1.inc";
gate gate_P877 q0,q1,q2,q3,q4 { sx q0; swap q1,q2; rzz(1.8578236547171387) q1,q2; ry(5.564602552771481) q3; s q3; sx q4; rzz(2.9231746334325015) q0,q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[4];
gate_P877 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
