OPENQASM 2.0;
include "qelib1.inc";
gate gate_P677 q0,q1,q2,q3,q4 { rx(2.997801729935127) q0; ry(5.717029791118218) q1; csx q1,q0; ccx q2,q3,q4; cswap q2,q4,q3; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P677 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
