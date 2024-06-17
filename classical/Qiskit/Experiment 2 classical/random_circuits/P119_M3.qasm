OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.501914419343885) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.364413066650323) q1; cx q0,q1; h q1; }
gate gate_P119 q0,q1,q2,q3,q4 { tdg q1; ccx q0,q3,q2; rzx(5.364413066650323) q0,q2; sdg q3; y q4; ryy(4.501914419343885) q1,q4; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P119 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
