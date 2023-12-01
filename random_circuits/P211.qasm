OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.086606092355049) q1; cx q0,q1; h q1; }
gate r(param0,param1) q0 { u3(5.802152436778055,-1.167453555075599,1.167453555075599) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.7986785277903417) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
y q[1];
rzx(4.086606092355049) q[3],q[0];
cx q[1],q[0];
tdg q[0];
s q[0];
y q[3];
h q[3];
rxx(0.7038463572268184) q[4],q[2];
t q[2];
cy q[1],q[2];
p(3.4148663108132973) q[1];
rz(0.3456912833382161) q[2];
r(5.802152436778055,0.40334277171929755) q[4];
h q[4];
ryy(1.7986785277903417) q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
