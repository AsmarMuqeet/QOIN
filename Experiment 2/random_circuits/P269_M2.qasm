OPENQASM 2.0;
include "qelib1.inc";
gate gate_P269 q0,q1,q2,q3,q4 { p(4.193516100563839) q0; u3(5.032890953246616,0.4764456999552881,4.522056830169803) q1; rzz(2.8527915224871614) q2,q3; swap q1,q2; cp(3.7516426083852052) q3,q0; sxdg q4; p(1.5095950604117474) q4; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[4];
gate_P269 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
