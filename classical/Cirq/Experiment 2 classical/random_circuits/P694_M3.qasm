OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.7043223721337446) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P694 q0,q1,q2,q3,q4 { s q1; cz q0,q3; x q0; t q3; ryy(2.7043223721337446) q2,q4; u1(4.455407570019255) q2; csx q4,q1; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[0];
gate_P694 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
