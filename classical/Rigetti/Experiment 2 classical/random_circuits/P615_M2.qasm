OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.439504024280666) q1; cx q0,q1; h q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.54914731274448) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P615 q0,q1,q2,q3,q4 { sx q1; rxx(2.137464424012901) q2,q3; ry(4.199487210880263) q2; ryy(4.54914731274448) q3,q1; swap q0,q4; rzx(5.439504024280666) q4,q0; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P615 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
