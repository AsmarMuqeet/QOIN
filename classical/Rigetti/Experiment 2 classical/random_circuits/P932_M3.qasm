OPENQASM 2.0;
include "qelib1.inc";
gate gate_P932 q0,q1,q2,q3,q4 { p(3.794792356538048) q0; ry(3.5209417843884165) q1; swap q0,q1; cy q0,q1; csx q2,q3; cu(3.062899674662057,1.9865073707227778,5.554046631516223,3.51683837202866) q3,q2; u1(5.003318744650825) q2; u1(1.159728630735137) q3; sx q4; y q4; sxdg q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P932 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
