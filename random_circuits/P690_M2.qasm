OPENQASM 2.0;
include "qelib1.inc";
gate xx_plus_yy(param0,param1) q0,q1 { rz(6.177456268915666) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-2.0716146225934193) q1; ry(-2.0716146225934193) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-6.177456268915666) q0; }
gate r(param0,param1) q0 { u3(3.1826763682752324,-0.0897754440909937,0.0897754440909937) q0; }
gate gate_P690 q0,q1,q2,q3,q4 { y q1; s q1; id q2; r(3.1826763682752324,1.4810208827039029) q2; s q3; cx q0,q4; s q0; xx_plus_yy(4.143229245186839,6.177456268915666) q3,q4; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[3];
gate_P690 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
