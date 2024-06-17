OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(1.1043222455729116,-0.390527330980297,0.390527330980297) q0; }
gate gate_P755 q0,q1,q2,q3,q4 { p(5.842859957534115) q0; ry(1.2535890681908033) q1; tdg q1; rz(0.46380081962405884) q2; r(1.1043222455729116,1.1802689958145995) q2; t q3; sdg q3; u1(1.7596258928664676) q4; cy q0,q4; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P755 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
