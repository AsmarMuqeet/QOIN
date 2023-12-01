OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.245757992899254) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
id q[0];
u1(5.650276711972707) q[3];
u(5.153465445014757,0.8652254884221839,4.018646540783921) q[3];
cu3(6.225147717780249,2.24019639430252,0.18594110865185762) q[5],q[2];
ryy(4.245757992899254) q[0],q[5];
cswap q[1],q[6],q[4];
t q[1];
sxdg q[4];
cz q[6],q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
