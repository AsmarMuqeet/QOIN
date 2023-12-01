OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.5153480937939006) q1; cx q0,q1; h q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.711828750792638) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P794 q0,q1,q2,q3,q4 { u3(4.075871129849332,2.729575033272653,4.905605378078047) q1; u1(6.055295481849778) q2; ry(3.7165123483998648) q2; ryy(2.711828750792638) q0,q3; rzx(2.5153480937939006) q3,q0; s q4; csx q4,q1; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P794 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
