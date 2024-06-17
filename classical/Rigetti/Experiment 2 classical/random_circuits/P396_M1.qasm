OPENQASM 2.0;
include "qelib1.inc";
gate xx_minus_yy(param0,param1) q0,q1 { rz(-2.8379540359033903) q1; rz(-pi/2) q0; sx q0; rz(pi/2) q0; s q1; cx q0,q1; ry(0.5278062538446545) q0; ry(-0.5278062538446545) q1; cx q0,q1; sdg q1; rz(-pi/2) q0; sxdg q0; rz(pi/2) q0; rz(2.8379540359033903) q1; }
gate gate_P396 q0,q1,q2,q3,q4 { rz(2.929147344709965) q0; h q1; ccx q3,q4,q2; ccx q1,q0,q4; cp(4.50774095137891) q1,q0; h q2; tdg q2; z q3; xx_minus_yy(1.055612507689309,2.8379540359033903) q4,q3; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P396 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
