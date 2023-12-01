OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.664448900128553,2.067034214968907,-2.067034214968907) q0; }
gate ryy_139921316458848(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.7903304143828718) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.5878033829544016) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P448 q0,q1,q2,q3,q4 { ryy(0.5878033829544016) q3,q0; cswap q4,q1,q2; ryy_139921316458848(0.7903304143828718) q0,q2; r(4.664448900128553,3.6378305417638037) q1; crx(5.376228424259735) q3,q4; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P448 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
