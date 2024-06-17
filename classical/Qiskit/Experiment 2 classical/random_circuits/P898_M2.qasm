OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.847281892209917,2.6078144639898353,-2.6078144639898353) q0; }
gate gate_P898 q0,q1,q2,q3,q4 { tdg q0; z q0; y q1; r(0.847281892209917,4.178610790784732) q1; u2(2.131956811452744,1.8107358451940405) q3; x q3; cy q4,q2; sxdg q2; rx(2.3234665530958556) q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P898 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
