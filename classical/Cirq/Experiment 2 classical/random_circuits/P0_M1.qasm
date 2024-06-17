OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.3702823943030358) q1; cx q0,q1; h q1; }
gate ryy_140286663143280(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.936173268420371) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.8982399182393657) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P0 q0,q1,q2,q3,q4,q5,q6 { p(1.474106691937938) q2; ryy(1.8982399182393657) q1,q3; ryy_140286663143280(2.936173268420371) q1,q2; s q4; rzz(6.231829263571707) q0,q5; ry(4.004299874580467) q0; rzx(1.3702823943030358) q5,q3; u(0.5377459023548055,1.643533473154437,2.135772017644075) q6; dcx q6,q4; }
qreg q[7];
creg c[3];
cx q[1],q[0];
gate_P0 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
