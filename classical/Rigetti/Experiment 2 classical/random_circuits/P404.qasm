OPENQASM 2.0;
include "qelib1.inc";
gate xx_plus_yy(param0,param1) q0,q1 { rz(1.8590816751788704) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-3.070340230622572) q1; ry(-3.070340230622572) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-1.8590816751788704) q0; }
qreg q[7];
creg c[3];
cswap q[1],q[2],q[0];
id q[0];
cu3(0.02643453647857002,1.7002977496253513,0.49127495188069725) q[1],q[2];
p(6.143949272249492) q[3];
sx q[4];
tdg q[5];
rxx(1.420873648833434) q[3],q[5];
h q[6];
xx_plus_yy(6.140680461245144,1.8590816751788704) q[4],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
