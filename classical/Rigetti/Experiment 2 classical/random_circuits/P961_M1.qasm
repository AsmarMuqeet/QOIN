OPENQASM 2.0;
include "qelib1.inc";
gate gate_P961 q0,q1,q2,q3,q4 { sx q1; id q1; u(4.0416055773902455,2.223921378308377,1.717778822793739) q1; p(2.705519504224897) q2; s q3; u1(3.027064425858646) q3; x q3; swap q1,q3; cp(1.7297521545311807) q0,q4; sx q0; y q0; h q0; cp(3.258780218430094) q4,q2; sdg q2; x q2; x q4; u1(6.255419546459423) q4; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P961 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
