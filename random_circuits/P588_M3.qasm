OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(6.029269643641478) q1; cx q0,q1; h q1; }
gate gate_P588 q0,q1,q2,q3,q4 { sxdg q2; z q2; rzx(6.029269643641478) q1,q3; x q1; sdg q3; cp(4.022665143338315) q4,q0; tdg q0; s q4; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P588 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
