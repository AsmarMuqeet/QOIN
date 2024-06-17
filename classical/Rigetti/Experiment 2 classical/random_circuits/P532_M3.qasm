OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(1.4772738869175277,-0.3580681518859077,0.3580681518859077) q0; }
gate gate_P532 q0,q1,q2,q3,q4 { rz(0.8972169724895586) q0; r(1.4772738869175277,1.2127281749089889) q0; y q3; ccx q4,q2,q1; cy q1,q2; ch q4,q3; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P532 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
