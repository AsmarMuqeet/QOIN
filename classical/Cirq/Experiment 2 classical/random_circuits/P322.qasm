OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.0547248957814654) q1; cx q0,q1; h q1; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(6.207243763645796) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
u3(1.3265703372556248,2.1626511504049697,2.9846441119501366) q[0];
tdg q[0];
u1(3.59100414636643) q[3];
tdg q[3];
ccx q[1],q[4],q[2];
id q[1];
u2(3.7196508975473184,5.485246771029006) q[2];
rzx(1.0547248957814654) q[2],q[0];
ryy(6.207243763645796) q[3],q[1];
tdg q[4];
h q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
