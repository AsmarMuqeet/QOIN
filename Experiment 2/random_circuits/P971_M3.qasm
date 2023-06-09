OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(2.368765336925884,4.702962862702854,-4.702962862702854) q0; }
gate gate_P971 q0,q1,q2,q3,q4 { p(4.8288155697334085) q0; sdg q0; y q1; r(2.368765336925884,6.273759189497751) q2; rz(3.436314093486839) q2; rxx(1.6951431414108102) q4,q3; cu(6.005432692922485,1.515164954742891,1.297378604103541,4.892080885637951) q3,q1; sxdg q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[4];
gate_P971 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
