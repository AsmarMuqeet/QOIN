OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.7845572215301395) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P658 q0,q1,q2,q3,q4 { u3(0.767936476049316,5.302889739581508,2.602034735969362) q2; rz(1.807384583059271) q2; cswap q3,q0,q1; ryy(1.7845572215301395) q1,q0; u(3.9538806013591614,3.762573581406463,1.1361684322383536) q3; rz(5.93733784238953) q4; x q4; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[2];
gate_P658 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
