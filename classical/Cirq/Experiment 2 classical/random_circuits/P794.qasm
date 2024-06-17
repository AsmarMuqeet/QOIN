OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.711828750792638) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.5153480937939006) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
u3(4.075871129849332,2.729575033272653,4.905605378078047) q[1];
u1(6.055295481849778) q[2];
ry(3.7165123483998648) q[2];
ryy(2.711828750792638) q[0],q[3];
rzx(2.5153480937939006) q[3],q[0];
s q[4];
csx q[4],q[1];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
