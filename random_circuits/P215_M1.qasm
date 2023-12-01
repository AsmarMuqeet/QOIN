OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.708721357374189) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.282261610947286) q1; cx q0,q1; h q1; }
gate gate_P215 q0,q1,q2,q3,q4 { rx(0.2926441855095437) q1; h q2; csx q3,q0; rzx(4.282261610947286) q0,q2; x q0; sxdg q2; ry(5.10136631027591) q3; id q4; ryy(1.708721357374189) q4,q1; rx(2.139401535476389) q1; cx q4,q3; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[3];
gate_P215 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
