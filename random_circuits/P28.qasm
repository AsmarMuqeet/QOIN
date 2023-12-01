OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(6.198472922100618) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
sxdg q[0];
u1(2.982733498709283) q[0];
sx q[1];
z q[1];
p(0.4615643711840329) q[2];
u3(4.340461193892793,2.5474953530069544,1.4193810829566786) q[2];
id q[3];
s q[4];
ryy(6.198472922100618) q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
