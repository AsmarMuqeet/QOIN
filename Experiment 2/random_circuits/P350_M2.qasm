OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.329421159538231) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P350 q0,q1,q2,q3,q4 { t q0; ry(2.0113857490093534) q0; u(5.590025961648832,1.8208413640061534,2.7117536475917237) q1; cy q3,q2; cy q3,q2; u(4.7178311750035835,1.5820753830732912,1.8952431610393465) q4; ryy(4.329421159538231) q1,q4; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P350 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
