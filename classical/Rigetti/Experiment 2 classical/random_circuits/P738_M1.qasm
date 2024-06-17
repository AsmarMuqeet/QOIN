OPENQASM 2.0;
include "qelib1.inc";
gate gate_P738 q0,q1,q2,q3,q4 { h q0; s q3; ccx q2,q4,q1; cswap q1,q3,q0; y q0; sxdg q1; sx q2; id q3; z q4; rzz(1.1897983787567943) q2,q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[1];
gate_P738 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
