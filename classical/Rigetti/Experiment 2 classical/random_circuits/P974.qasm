OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.948582983485721) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate xx_minus_yy(param0,param1) q0,q1 { rz(-5.164955137054919) q1; rz(-pi/2) q0; sx q0; rz(pi/2) q0; s q1; cx q0,q1; ry(2.4240288535952925) q0; ry(-2.4240288535952925) q1; cx q0,q1; sdg q1; rz(-pi/2) q0; sxdg q0; rz(pi/2) q0; rz(5.164955137054919) q1; }
qreg q[7];
creg c[3];
rz(5.302326158353515) q[0];
y q[0];
id q[3];
u2(1.2206678784610563,4.671142373183676) q[3];
ryy(2.948582983485721) q[2],q[4];
h q[2];
cu3(0.01803022508681708,4.759504387672334,2.5587699312416947) q[5],q[1];
s q[1];
sdg q[5];
u1(4.878105486689573) q[6];
xx_minus_yy(4.848057707190585,5.164955137054919) q[4],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
