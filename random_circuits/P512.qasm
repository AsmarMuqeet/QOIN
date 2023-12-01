OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.198445219814355) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
y q[3];
ryy(4.198445219814355) q[4],q[1];
id q[1];
z q[5];
ch q[5],q[3];
ccx q[6],q[0],q[2];
id q[0];
y q[2];
crx(0.47514623267998685) q[4],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
