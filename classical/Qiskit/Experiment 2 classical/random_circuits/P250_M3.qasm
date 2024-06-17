OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(3.354973915711563) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P250 q0,q1,q2,q3,q4,q5,q6 { u1(0.364508403424724) q0; sdg q0; x q1; sxdg q1; u1(0.628976765370331) q3; rz(2.817717420766905) q3; tdg q4; tdg q4; ryy(3.354973915711563) q2,q5; rz(0.39304396169700967) q2; sdg q6; cx q5,q6; }
qreg q[7];
creg c[3];
cx q[2],q[1];
gate_P250 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
