OPENQASM 2.0;
include "qelib1.inc";
gate xx_plus_yy(param0,param1) q0,q1 { rz(1.609259247550925) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-1.0610281812512616) q1; ry(-1.0610281812512616) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-1.609259247550925) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.2894444149551456) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P793 q0,q1,q2,q3,q4 { cswap q3,q1,q0; h q0; rz(5.657025135234319) q3; rxx(3.887341789777101) q0,q3; ryy(1.2894444149551456) q2,q4; cp(4.354807196184324) q2,q1; x q2; cx q2,q3; y q2; sxdg q4; rxx(0.8662579377719828) q1,q4; sx q1; sx q1; rzz(3.0565260331803072) q4,q0; s q0; xx_plus_yy(2.1220563625025233,1.609259247550925) q4,q3; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[1];
gate_P793 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
