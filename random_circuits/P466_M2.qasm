OPENQASM 2.0;
include "qelib1.inc";
gate gate_P466 q0,q1,q2,q3,q4 { rzz(5.398061185566107) q0,q1; h q2; sxdg q2; csx q3,q4; ccx q1,q0,q4; u2(1.796682541221646,4.642021084332704) q3; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[4];
gate_P466 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
