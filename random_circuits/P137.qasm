OPENQASM 2.0;
include "qelib1.inc";
gate xx_plus_yy(param0,param1) q0,q1 { rz(2.246199030234229) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-0.40215955127759473) q1; ry(-0.40215955127759473) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-2.246199030234229) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.409559886322032) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
h q[1];
sx q[2];
y q[4];
rz(2.870823413956173) q[4];
swap q[5],q[0];
z q[5];
cx q[6],q[3];
cswap q[1],q[3],q[0];
id q[1];
xx_plus_yy(0.8043191025551895,2.246199030234229) q[5],q[3];
ryy(4.409559886322032) q[6],q[2];
rxx(1.9481336639244722) q[0],q[2];
ch q[6],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
