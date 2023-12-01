OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.8982399182393657) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy_140286663143280(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.936173268420371) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.3702823943030358) q1; cx q0,q1; h q1; }
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
qreg q[7];
creg c[3];
p(1.474106691937938) q[2];
ryy(1.8982399182393657) q[1],q[3];
ryy_140286663143280(2.936173268420371) q[1],q[2];
s q[4];
rzz(6.231829263571707) q[0],q[5];
ry(4.004299874580467) q[0];
rzx(1.3702823943030358) q[5],q[3];
u(0.5377459023548055,1.643533473154437,2.135772017644075) q[6];
dcx q[6],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
