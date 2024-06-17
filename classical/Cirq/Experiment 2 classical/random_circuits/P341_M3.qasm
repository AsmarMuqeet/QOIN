OPENQASM 2.0;
include "qelib1.inc";
gate gate_P341 q0,q1,q2,q3,q4 { rz(5.372265372198865) q0; p(2.876901897011106) q1; s q1; u2(5.169002519915481,5.323611634816096) q2; u(2.227369081117446,4.132403668262277,6.255964812668439) q2; sdg q3; tdg q4; cswap q0,q3,q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P341 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
