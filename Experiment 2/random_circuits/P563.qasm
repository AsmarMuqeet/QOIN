OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.8986571232258225) q1; cx q0,q1; h q1; }
gate xx_plus_yy(param0,param1) q0,q1 { rz(1.284741981716974) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-1.2282741623050366) q1; ry(-1.2282741623050366) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-1.284741981716974) q0; }
qreg q[7];
creg c[3];
sdg q[1];
z q[1];
cu3(6.227922361760654,1.83130736773709,0.175309677822327) q[0],q[3];
sdg q[3];
rzx(2.8986571232258225) q[4],q[2];
cu(3.3708375141294877,2.695974962516997,2.051443323325902,2.058621323249986) q[0],q[2];
id q[4];
xx_plus_yy(2.456548324610073,1.284741981716974) q[6],q[5];
ch q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
