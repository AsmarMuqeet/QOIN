OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.678478219655284) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r(param0,param1) q0 { u3(4.213464481604291,-0.26743617950157805,0.26743617950157805) q0; }
gate gate_P343 q0,q1,q2,q3,q4 { u3(5.307737663129588,5.534284743118802,4.730543982544885) q0; ry(2.447110199339939) q0; s q3; r(4.213464481604291,1.3033601472933185) q3; ccx q2,q4,q1; ryy(3.678478219655284) q1,q4; rz(0.9444532373571871) q2; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[4];
gate_P343 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
