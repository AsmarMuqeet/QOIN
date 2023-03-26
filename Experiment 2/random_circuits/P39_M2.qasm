OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.2921358597114074) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P39 q0,q1,q2,q3,q4 { ccx q0,q2,q1; sx q1; sxdg q2; t q2; t q2; cx q4,q3; ryy(3.2921358597114074) q3,q0; rz(5.048293816189334) q0; u(0.8144760316789287,1.4110236196993415,3.4360190514429956) q0; x q3; sx q3; h q4; cx q4,q1; cu3(0.5453767740228046,1.1850222929243692,5.796168060142781) q4,q1; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[3];
gate_P39 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
