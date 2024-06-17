OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.007380427593689) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P280 q0,q1,q2,q3,q4,q5,q6 { cp(1.609594832299891) q1,q2; rz(4.464250510359594) q2; tdg q3; p(1.128247547356392) q4; ch q4,q3; s q5; sxdg q5; cp(5.28181402298581) q0,q6; p(2.881402270836578) q0; ryy(5.007380427593689) q1,q6; }
qreg q[7];
creg c[3];
cx q[0],q[2];
gate_P280 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
