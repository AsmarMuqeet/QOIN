OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.531305132221214) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.3646947217458443) q1; cx q0,q1; h q1; }
gate gate_P415 q0,q1,q2,q3,q4 { h q1; rzx(1.3646947217458443) q3,q0; cu1(5.6428427602674445) q1,q3; ryy(4.531305132221214) q2,q4; id q2; cx q4,q0; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[3];
gate_P415 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
