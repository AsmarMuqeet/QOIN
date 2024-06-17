OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.2301083058712118) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy_139921318348496(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.12676641042242437) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P455 q0,q1,q2,q3,q4 { z q0; cu(3.179820744830222,3.8024548266943103,1.027288278217194,1.2961392612187566) q3,q1; ryy_139921318348496(0.12676641042242437) q0,q1; y q3; ryy(0.2301083058712118) q2,q4; p(0.7977291463981215) q2; u(3.4717338870567636,4.2944418477740784,3.4682690771995905) q4; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[0];
gate_P455 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
