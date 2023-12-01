OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.859246426759953) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy_139921317241760(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.466861292722735) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
t q[0];
x q[0];
sxdg q[1];
ryy(3.859246426759953) q[2],q[3];
cu3(3.5998011306918642,0.6034032830065201,4.692837909544816) q[1],q[3];
s q[1];
p(2.4982345350348196) q[2];
ryy_139921317241760(5.466861292722735) q[0],q[2];
t q[3];
rz(4.137387327038625) q[4];
sxdg q[4];
ry(2.8787941432786837) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
