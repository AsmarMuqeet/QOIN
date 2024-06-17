OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.409559886322032) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate xx_plus_yy(param0,param1) q0,q1 { rz(2.246199030234229) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-0.40215955127759473) q1; ry(-0.40215955127759473) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-2.246199030234229) q0; }
gate gate_P137 q0,q1,q2,q3,q4,q5,q6 { h q1; sx q2; y q4; rz(2.870823413956173) q4; swap q5,q0; z q5; cx q6,q3; cswap q1,q3,q0; id q1; xx_plus_yy(0.8043191025551895,2.246199030234229) q5,q3; ryy(4.409559886322032) q6,q2; rxx(1.9481336639244722) q0,q2; ch q6,q4; }
qreg q[7];
creg c[3];
ccx q[0],q[1],q[4];
gate_P137 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
