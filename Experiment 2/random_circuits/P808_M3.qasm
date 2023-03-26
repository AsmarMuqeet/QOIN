OPENQASM 2.0;
include "qelib1.inc";
gate gate_P808 q0,q1,q2,q3,q4 { y q0; id q0; id q2; rzz(0.6089799647440994) q1,q3; rz(5.33937754789137) q1; csx q3,q2; ry(1.3796601421243566) q4; sx q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[0];
gate_P808 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
