OPENQASM 2.0;
include "qelib1.inc";
gate xx_plus_yy(param0,param1) q0,q1 { rz(4.598055601599999) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-1.4163864082796511) q1; ry(-1.4163864082796511) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-4.598055601599999) q0; }
gate r(param0,param1) q0 { u3(6.071788777145799,1.586223843277204,-1.586223843277204) q0; }
qreg q[7];
creg c[3];
rzz(0.42779267940392357) q[2],q[4];
cx q[4],q[2];
xx_plus_yy(2.8327728165593022,4.598055601599999) q[3],q[5];
t q[3];
sx q[5];
ccx q[0],q[1],q[6];
ry(3.7994484534310704) q[0];
r(6.071788777145799,3.1570201700721006) q[1];
sx q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
