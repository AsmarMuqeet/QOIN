OPENQASM 2.0;
include "qelib1.inc";
gate gate_P937 q0,q1,q2,q3,q4 { sdg q2; rx(3.9161013888461174) q2; cx q3,q0; u(2.5579447538732647,0.8885829294958949,1.9918901195392318) q0; x q0; s q3; cy q3,q2; csx q4,q1; u1(2.1339116310364683) q1; u1(2.298836679425315) q1; s q4; u3(4.053354903388705,3.4450928011760213,6.002478364994482) q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[4];
gate_P937 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
