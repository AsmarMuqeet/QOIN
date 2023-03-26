OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.2401156388733012) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
s q[0];
s q[2];
sx q[2];
h q[3];
cz q[4],q[1];
swap q[0],q[1];
ryy(2.2401156388733012) q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
