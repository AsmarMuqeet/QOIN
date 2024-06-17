OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.282261610947286) q1; cx q0,q1; h q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.708721357374189) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
rx(0.2926441855095437) q[1];
h q[2];
csx q[3],q[0];
rzx(4.282261610947286) q[0],q[2];
x q[0];
sxdg q[2];
ry(5.10136631027591) q[3];
id q[4];
ryy(1.708721357374189) q[4],q[1];
rx(2.139401535476389) q[1];
cx q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
