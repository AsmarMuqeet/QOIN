OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.8812363856811539) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P710 q0,q1,q2,q3,q4 { rz(5.114832530596392) q2; ryy(0.8812363856811539) q0,q3; csx q0,q3; rxx(1.4736085122065845) q1,q4; cswap q4,q1,q2; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[3];
gate_P710 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
