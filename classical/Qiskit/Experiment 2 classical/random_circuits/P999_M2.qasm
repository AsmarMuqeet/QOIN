OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(3.476650073510577,0.5858408985030095,-0.5858408985030095) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.1493824938903767) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P999 q0,q1,q2,q3,q4 { sdg q2; id q2; rzz(5.156299388137132) q3,q0; ryy(3.1493824938903767) q3,q0; rxx(6.10381966874432) q1,q4; r(3.476650073510577,2.156637225297906) q1; y q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[4];
gate_P999 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
