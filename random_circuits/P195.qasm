OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.997598357560125) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
ccx q[2],q[0],q[4];
ryy(3.997598357560125) q[0],q[4];
u1(5.143843216900704) q[2];
cy q[5],q[1];
csx q[5],q[1];
rzz(5.761247793735771) q[3],q[6];
s q[3];
u3(1.5247241173217387,1.2885195980664441,2.2136495082240017) q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
