OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.198445219814355) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P512 q0,q1,q2,q3,q4,q5,q6 { y q3; ryy(4.198445219814355) q4,q1; id q1; z q5; ch q5,q3; ccx q6,q0,q2; id q0; y q2; crx(0.47514623267998685) q4,q6; }
qreg q[7];
creg c[3];
cx q[2],q[1];
gate_P512 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
