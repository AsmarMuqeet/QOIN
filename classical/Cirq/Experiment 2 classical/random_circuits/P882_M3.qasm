OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.956672050754548) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P882 q0,q1,q2,q3,q4 { sx q1; x q1; sxdg q1; csx q0,q2; ryy(4.956672050754548) q2,q0; sx q0; ry(4.4408425267824105) q2; u(4.83566150874054,5.380983222207602,5.018047781143692) q3; sdg q4; ch q3,q4; cry(6.083503547210192) q4,q3; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P882 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
