OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.54914731274448) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.439504024280666) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
sx q[1];
rxx(2.137464424012901) q[2],q[3];
ry(4.199487210880263) q[2];
ryy(4.54914731274448) q[3],q[1];
swap q[0],q[4];
rzx(5.439504024280666) q[4],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
