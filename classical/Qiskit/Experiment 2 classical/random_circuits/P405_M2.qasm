OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.0806457788664288) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r(param0,param1) q0 { u3(5.435327335541057,-1.27696735399212,1.27696735399212) q0; }
gate gate_P405 q0,q1,q2,q3,q4 { r(5.435327335541057,0.2938289728027764) q0; u3(1.6521811124977475,3.60097159770963,2.647527413692607) q2; rxx(2.7797293788888844) q1,q3; id q1; ry(6.040695525647809) q3; ryy(3.0806457788664288) q1,q3; s q3; u1(4.739858292998829) q4; ccx q4,q2,q0; rxx(3.5859049928230227) q0,q4; t q0; x q2; y q2; csx q4,q1; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[2];
gate_P405 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
