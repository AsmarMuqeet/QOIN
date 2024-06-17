OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.4618713362073215) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P507 q0,q1,q2,q3,q4,q5,q6 { id q0; rz(2.5802265291794524) q3; cy q3,q0; ry(3.5775339597063014) q0; h q4; y q5; s q5; p(0.2935444534651498) q5; cswap q6,q2,q1; u2(2.295746614622213,5.878934150326474) q1; ryy(2.4618713362073215) q2,q4; cu1(1.671356659175942) q2,q1; csx q4,q3; h q6; rz(5.855915684187274) q6; }
qreg q[7];
creg c[3];
cx q[2],q[0];
gate_P507 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
