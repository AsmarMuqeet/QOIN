OPENQASM 2.0;
include "qelib1.inc";
gate xx_minus_yy(param0,param1) q0,q1 { rz(-3.0063996926735315) q1; rz(-pi/2) q0; sx q0; rz(pi/2) q0; s q1; cx q0,q1; ry(1.3247781945663655) q0; ry(-1.3247781945663655) q1; cx q0,q1; sdg q1; rz(-pi/2) q0; sxdg q0; rz(pi/2) q0; rz(3.0063996926735315) q1; }
qreg q[5];
creg c[3];
sx q[0];
cy q[1],q[2];
sdg q[1];
cu1(2.6648093352527917) q[2],q[0];
xx_minus_yy(2.649556389132731,3.0063996926735315) q[3],q[4];
crz(1.1009031605482076) q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
