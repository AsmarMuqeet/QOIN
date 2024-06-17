OPENQASM 2.0;
include "qelib1.inc";
gate gate_P647 q0,q1,q2,q3,q4 { cu3(1.6028489791745315,5.958297079572675,2.540346826992463) q1,q0; rx(4.821176133788238) q0; t q1; id q2; rxx(2.940942110933269) q4,q3; rxx(4.78306690896601) q2,q4; sxdg q3; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[3];
gate_P647 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
