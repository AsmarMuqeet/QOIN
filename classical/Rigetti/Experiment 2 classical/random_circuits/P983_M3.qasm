OPENQASM 2.0;
include "qelib1.inc";
gate xx_plus_yy(param0,param1) q0,q1 { rz(0.6314128986596151) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-2.7876520724560754) q1; ry(-2.7876520724560754) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-0.6314128986596151) q0; }
gate gate_P983 q0,q1,q2,q3,q4 { cswap q2,q0,q1; z q0; cu(4.8301684084612715,1.679650481010952,4.384177979419593,4.120916037946989) q1,q2; rzz(4.621016678131002) q3,q4; xx_plus_yy(5.575304144912151,0.6314128986596151) q3,q4; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[3];
gate_P983 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
