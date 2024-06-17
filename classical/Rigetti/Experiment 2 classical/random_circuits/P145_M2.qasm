OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(3.499105174588241,3.402949766606967,-3.402949766606967) q0; }
gate xx_plus_yy(param0,param1) q0,q1 { rz(5.099554828660598) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-0.2580852947584738) q1; ry(-0.2580852947584738) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-5.099554828660598) q0; }
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(2.875935262349239) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P145 q0,q1,q2,q3,q4 { tdg q0; u1(5.599145762031702) q1; sdg q1; t q2; ryy(2.875935262349239) q2,q0; xx_plus_yy(0.5161705895169476,5.099554828660598) q3,q4; sx q3; r(3.499105174588241,4.973746093401863) q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P145 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
