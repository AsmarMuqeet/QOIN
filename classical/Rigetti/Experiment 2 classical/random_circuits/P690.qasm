OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(3.1826763682752324,-0.0897754440909937,0.0897754440909937) q0; }
gate xx_plus_yy(param0,param1) q0,q1 { rz(6.177456268915666) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-2.0716146225934193) q1; ry(-2.0716146225934193) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-6.177456268915666) q0; }
qreg q[5];
creg c[3];
y q[1];
s q[1];
id q[2];
r(3.1826763682752324,1.4810208827039029) q[2];
s q[3];
cx q[0],q[4];
s q[0];
xx_plus_yy(4.143229245186839,6.177456268915666) q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
