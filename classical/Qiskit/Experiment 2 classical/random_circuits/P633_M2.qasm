OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.245757992899254) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P633 q0,q1,q2,q3,q4,q5,q6 { id q0; u1(5.650276711972707) q3; u(5.153465445014757,0.8652254884221839,4.018646540783921) q3; cu3(6.225147717780249,2.24019639430252,0.18594110865185762) q5,q2; ryy(4.245757992899254) q0,q5; cswap q1,q6,q4; t q1; sxdg q4; cz q6,q2; }
qreg q[7];
creg c[3];
cx q[2],q[0];
gate_P633 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
