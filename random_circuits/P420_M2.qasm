OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.537402011870087) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.0598669809292494) q1; cx q0,q1; h q1; }
gate gate_P420 q0,q1,q2,q3,q4 { cy q1,q2; rzx(1.0598669809292494) q0,q3; cu1(3.7855310427878113) q2,q0; ry(2.104825418779461) q3; tdg q4; ryy(5.537402011870087) q4,q1; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[4];
gate_P420 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
