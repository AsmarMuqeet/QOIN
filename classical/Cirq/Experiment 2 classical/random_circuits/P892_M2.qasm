OPENQASM 2.0;
include "qelib1.inc";
gate gate_P892 q0,q1,q2,q3,q4 { t q0; sdg q0; u2(5.690678848209483,0.7827778374928085) q1; s q3; cp(5.494419815770043) q4,q2; swap q2,q3; rxx(3.258135251650114) q4,q1; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P892 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
