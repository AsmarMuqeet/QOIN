OPENQASM 2.0;
include "qelib1.inc";
gate ryy_139921335673952(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.3076483453241932) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.949280744242961) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r_139921335673568(param0,param1) q0 { u3(3.101407923191431,4.489807085438248,-4.489807085438248) q0; }
gate r(param0,param1) q0 { u3(1.1260782067313215,3.125168033137272,-3.125168033137272) q0; }
gate gate_P464 q0,q1,q2,q3,q4 { r(1.1260782067313215,4.6959643599321685) q0; y q1; ry(4.91230369668353) q3; r_139921335673568(3.101407923191431,6.060603412233145) q3; cx q4,q2; ryy(5.949280744242961) q0,q4; ryy_139921335673952(1.3076483453241932) q1,q2; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[0];
gate_P464 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];