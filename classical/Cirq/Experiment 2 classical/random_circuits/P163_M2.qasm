OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.8842918589711466) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P163 q0,q1,q2,q3,q4 { sxdg q1; z q2; u3(4.280170677264077,0.8647299131731205,0.17254589105730417) q2; h q2; id q2; rx(4.311059262627165) q3; rx(2.3599080730209514) q3; sxdg q3; cx q0,q4; cu3(3.5548684566062763,4.023648016368769,0.5089438852270655) q1,q0; ry(4.174148839945921) q0; tdg q0; rz(5.374335910615837) q4; ryy(1.8842918589711466) q1,q4; y q1; cu1(0.882860860374468) q3,q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P163 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
