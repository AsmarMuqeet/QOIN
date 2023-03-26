OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.3991671817360065) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P778 q0,q1,q2,q3,q4,q5,q6 { cy q0,q2; rx(1.250450634908365) q0; h q2; ryy(1.3991671817360065) q4,q3; x q3; u3(3.7274489291235953,5.13056243159953,5.039174562794708) q5; sxdg q5; rzz(4.556903147627993) q6,q1; id q1; rxx(5.1092236330667795) q4,q6; }
qreg q[7];
creg c[3];
ccx q[0],q[2],q[4];
gate_P778 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
