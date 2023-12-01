OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.7986785277903417) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r(param0,param1) q0 { u3(5.802152436778055,-1.167453555075599,1.167453555075599) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.086606092355049) q1; cx q0,q1; h q1; }
gate gate_P211 q0,q1,q2,q3,q4 { y q1; rzx(4.086606092355049) q3,q0; cx q1,q0; tdg q0; s q0; y q3; h q3; rxx(0.7038463572268184) q4,q2; t q2; cy q1,q2; p(3.4148663108132973) q1; rz(0.3456912833382161) q2; r(5.802152436778055,0.40334277171929755) q4; h q4; ryy(1.7986785277903417) q4,q3; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[3];
gate_P211 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
