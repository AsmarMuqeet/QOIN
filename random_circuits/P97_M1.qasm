OPENQASM 2.0;
include "qelib1.inc";
gate gate_P97 q0,q1,q2,q3,q4 { id q1; y q1; ry(2.3656562342963974) q2; id q2; cswap q0,q3,q4; rx(5.375095025820171) q0; h q3; rx(1.1537821046254417) q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[1];
gate_P97 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
