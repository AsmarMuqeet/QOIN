OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.853629666053625,0.966880454671065,-0.966880454671065) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.9077011611733317) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P206 q0,q1,q2,q3,q4 { tdg q0; rzz(2.5462047766736298) q2,q1; ryy(1.9077011611733317) q0,q1; u(2.769700013655946,3.500178022898715,4.371848177028608) q2; u1(3.607542772449381) q3; u1(1.6669268868140323) q3; cz q3,q1; tdg q1; t q3; t q4; y q4; cswap q2,q4,q0; t q0; id q2; r(0.853629666053625,2.5376767814659615) q4; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P206 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
