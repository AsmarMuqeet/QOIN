OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.5505187752610077) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P846 q0,q1,q2,q3,q4 { u1(0.6767361277258369) q1; u1(1.5209879442840706) q1; y q1; rz(0.6263664466582738) q2; cz q0,q3; u3(1.7977350471511475,2.62425860126448,4.552389784041176) q0; rz(1.2549103333730893) q3; tdg q3; cy q1,q3; sx q4; csx q2,q4; ryy(3.5505187752610077) q2,q0; rx(4.080238637776521) q0; sx q2; h q4; y q4; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[2];
gate_P846 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
