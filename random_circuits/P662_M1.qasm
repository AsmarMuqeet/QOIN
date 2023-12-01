OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.391872078040627) q1; cx q0,q1; h q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.6399041260314922) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P662 q0,q1,q2,q3,q4,q5,q6 { ryy(1.6399041260314922) q0,q1; p(0.0965313730203274) q0; h q3; rzx(4.391872078040627) q4,q2; cswap q1,q2,q4; y q5; h q6; cswap q6,q3,q5; }
qreg q[7];
creg c[3];
ccx q[0],q[1],q[3];
gate_P662 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
