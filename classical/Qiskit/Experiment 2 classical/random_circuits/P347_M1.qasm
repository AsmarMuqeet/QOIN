OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(4.176094568045129,3.7245920226332867,-3.7245920226332867) q0; }
gate gate_P347 q0,q1,q2,q3,q4 { ccx q2,q1,q0; r(4.176094568045129,5.295388349428183) q1; sxdg q2; z q3; rx(0.7077401084299517) q3; sdg q4; cy q4,q0; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[2];
gate_P347 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
