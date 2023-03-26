OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(6.092295615584952) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.06190582399907) q1; cx q0,q1; h q1; }
gate gate_P510 q0,q1,q2,q3,q4 { u1(5.595133418371506) q0; t q1; z q1; rz(2.790708237055765) q1; tdg q1; u1(3.16058452377816) q1; sdg q2; cu1(4.632702891211105) q3,q4; rzx(4.06190582399907) q0,q4; tdg q0; sx q0; id q0; ryy(6.092295615584952) q2,q3; sx q2; t q2; p(4.281703268670884) q3; p(6.192079846191351) q4; cu(5.366407856554934,1.1016708428456516,1.6154468918819573,0.772944257888552) q4,q3; cu1(3.653912513219358) q2,q3; sdg q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P510 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
