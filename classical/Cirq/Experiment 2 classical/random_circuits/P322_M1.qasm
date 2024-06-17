OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(6.207243763645796) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.0547248957814654) q1; cx q0,q1; h q1; }
gate gate_P322 q0,q1,q2,q3,q4 { u3(1.3265703372556248,2.1626511504049697,2.9846441119501366) q0; tdg q0; u1(3.59100414636643) q3; tdg q3; ccx q1,q4,q2; id q1; u2(3.7196508975473184,5.485246771029006) q2; rzx(1.0547248957814654) q2,q0; ryy(6.207243763645796) q3,q1; tdg q4; h q4; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[3];
gate_P322 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
