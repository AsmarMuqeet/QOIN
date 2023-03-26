OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(1.4772738869175277,-0.3580681518859077,0.3580681518859077) q0; }
qreg q[5];
creg c[3];
rz(0.8972169724895586) q[0];
r(1.4772738869175277,1.2127281749089889) q[0];
y q[3];
ccx q[4],q[2],q[1];
cy q[1],q[2];
ch q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
