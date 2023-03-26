OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.2401156388733012) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P126 q0,q1,q2,q3,q4 { s q0; s q2; sx q2; h q3; cz q4,q1; swap q0,q1; ryy(2.2401156388733012) q4,q3; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[3];
gate_P126 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
