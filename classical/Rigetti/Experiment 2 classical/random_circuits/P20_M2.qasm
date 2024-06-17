OPENQASM 2.0;
include "qelib1.inc";
gate gate_P20 q0,q1,q2,q3,q4 { rz(3.325585487674534) q0; s q1; cx q3,q2; sdg q2; h q2; sx q2; cswap q3,q0,q1; p(1.8767113914908566) q1; sx q1; s q3; u1(2.0631207799551357) q3; rx(4.441360668652007) q4; tdg q4; cu3(4.098693850262225,0.9645082215971419,2.5357726386194135) q0,q4; sxdg q0; p(5.117530647757714) q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P20 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
