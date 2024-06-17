OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.8292220376189464) q1; cx q0,q1; h q1; }
gate r(param0,param1) q0 { u3(1.0979212121790722,1.1614199344947198,-1.1614199344947198) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.5435606536639956) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
id q[0];
rzz(2.472951962586622) q[2],q[1];
cz q[0],q[2];
swap q[2],q[0];
ry(2.345098084174532) q[2];
rzx(0.8292220376189464) q[4],q[3];
cz q[1],q[4];
id q[1];
z q[1];
r(1.0979212121790722,2.7322162612896164) q[3];
t q[3];
ryy(3.5435606536639956) q[0],q[3];
y q[4];
rx(2.245295458326594) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
