OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.476933454943862) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P372 q0,q1,q2,q3,q4,q5,q6 { p(5.430795287528111) q0; u3(4.9805680938152435,1.550119308107003,1.4448941989728958) q3; cx q3,q0; ryy(5.476933454943862) q4,q1; cy q1,q4; u2(2.7311359325139746,2.882138382572935) q5; h q5; cu3(4.015715962481229,4.726912492681324,1.3527663507521788) q6,q2; id q2; z q6; }
qreg q[7];
creg c[3];
ccx q[2],q[1],q[4];
gate_P372 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
