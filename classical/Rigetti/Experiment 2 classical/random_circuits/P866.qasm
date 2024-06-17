OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.4056014042195133) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.13976178502014) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
u3(2.5501121904360864,3.036339590142659,4.842254109405476) q[0];
id q[0];
cz q[1],q[3];
u1(0.9098542629013519) q[1];
id q[1];
cx q[4],q[2];
y q[2];
z q[2];
ryy(2.4056014042195133) q[4],q[3];
u3(2.93139240787596,1.0050562664716465,2.577837568478881) q[3];
rzx(4.13976178502014) q[4],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
