OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.1493824938903767) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r(param0,param1) q0 { u3(3.476650073510577,0.5858408985030095,-0.5858408985030095) q0; }
qreg q[5];
creg c[3];
sdg q[2];
id q[2];
rzz(5.156299388137132) q[3],q[0];
ryy(3.1493824938903767) q[3],q[0];
rxx(6.10381966874432) q[1],q[4];
r(3.476650073510577,2.156637225297906) q[1];
y q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
