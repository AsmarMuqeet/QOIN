OPENQASM 2.0;
include "qelib1.inc";
gate gate_P444 q0,q1,q2,q3,q4 { cx q0,q1; rz(1.2891165457613978) q0; t q3; rz(2.9801534004415897) q3; csx q2,q4; x q2; rxx(5.623430024161368) q4,q1; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[4];
gate_P444 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
