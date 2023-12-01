OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.465195741164204) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P589 q0,q1,q2,q3,q4 { u(5.564083548281149,6.065768500916784,1.317354948085167) q1; sxdg q1; x q1; ryy(4.465195741164204) q2,q0; t q0; sxdg q0; z q0; cx q4,q3; cp(4.558237211083725) q3,q2; u1(4.7719352964403345) q2; swap q1,q2; x q4; csx q4,q3; rxx(4.01437378688526) q3,q4; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P589 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
