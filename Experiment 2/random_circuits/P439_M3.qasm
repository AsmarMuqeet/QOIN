OPENQASM 2.0;
include "qelib1.inc";
gate gate_P439 q0,q1,q2,q3,q4 { cu3(5.517224966722686,2.93490836563912,2.506010892893033) q2,q0; rzz(1.4763529724673168) q1,q3; cu3(4.436003493701307,3.507781580599946,4.309817451239791) q1,q2; sdg q3; u2(5.462962092486509,1.9592873167345553) q4; cy q0,q4; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[4];
gate_P439 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
