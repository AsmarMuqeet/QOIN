OPENQASM 2.0;
include "qelib1.inc";
gate gate_P133 q0,q1,q2,q3,q4 { cu3(2.1017651848160472,2.3570942357713034,3.476777118507131) q2,q1; x q1; p(1.76627614027516) q2; csx q3,q0; rx(1.962948488013413) q4; cswap q0,q3,q4; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[3];
gate_P133 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
