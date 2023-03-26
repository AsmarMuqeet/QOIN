OPENQASM 2.0;
include "qelib1.inc";
gate gate_P529 q0,q1,q2,q3,q4 { u1(4.7462745229055665) q0; z q0; t q1; rx(0.635436074878598) q2; u(6.151011428271311,4.038732738552623,3.62814517167217) q2; y q3; rzz(5.112178585928108) q1,q3; u1(3.8691899179964366) q4; t q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P529 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
