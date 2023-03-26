OPENQASM 2.0;
include "qelib1.inc";
gate gate_P523 q0,q1,q2,q3,q4 { sx q0; sxdg q0; csx q1,q2; sx q3; csx q2,q3; rx(6.095528204562359) q2; sx q4; csx q1,q4; cswap q3,q1,q0; ccx q1,q0,q2; u1(1.420062653706502) q4; crx(0.634837988440171) q4,q3; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[2];
gate_P523 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
