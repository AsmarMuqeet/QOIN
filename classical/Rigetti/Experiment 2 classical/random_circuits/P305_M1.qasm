OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.5435606536639956) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r(param0,param1) q0 { u3(1.0979212121790722,1.1614199344947198,-1.1614199344947198) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.8292220376189464) q1; cx q0,q1; h q1; }
gate gate_P305 q0,q1,q2,q3,q4 { id q0; rzz(2.472951962586622) q2,q1; cz q0,q2; swap q2,q0; ry(2.345098084174532) q2; rzx(0.8292220376189464) q4,q3; cz q1,q4; id q1; z q1; r(1.0979212121790722,2.7322162612896164) q3; t q3; ryy(3.5435606536639956) q0,q3; y q4; rx(2.245295458326594) q4; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P305 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
