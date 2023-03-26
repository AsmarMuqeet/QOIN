OPENQASM 2.0;
include "qelib1.inc";
gate gate_P531 q0,q1,q2,q3,q4 { u2(1.3192520072979639,1.3452669693206605) q0; t q0; rzz(2.1397085547355177) q3,q1; sdg q1; u(1.3444732770246932,4.070158622625482,3.736191119059982) q3; cy q4,q2; csx q4,q2; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[3];
gate_P531 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
