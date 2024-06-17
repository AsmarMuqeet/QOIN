OPENQASM 2.0;
include "qelib1.inc";
gate ryy_139921335427280(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.885360263152343) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.0278967637118076) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate r(param0,param1) q0 { u3(5.265930038903686,-1.3695874618503352,1.3695874618503352) q0; }
gate gate_P996 q0,q1,q2,q3,q4 { r(5.265930038903686,0.20120886494456133) q0; id q1; u1(1.6208500145150104) q1; tdg q1; id q2; u3(1.1471537457376264,4.20213631530779,5.4917389970624635) q2; sdg q3; ryy(0.0278967637118076) q0,q3; sxdg q0; x q0; tdg q3; z q3; sdg q4; y q4; ryy_139921335427280(3.885360263152343) q4,q2; swap q1,q4; z q2; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[1];
gate_P996 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
