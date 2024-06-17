OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.53373905225224) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P173 q0,q1,q2,q3,q4 { x q0; x q1; rz(2.0892611651942157) q1; ccx q2,q4,q3; csx q0,q4; p(4.112706188531515) q0; x q2; cy q2,q4; s q3; cu1(1.9115531619602948) q3,q1; sx q1; id q1; cu(4.435072052601562,3.8968735190926895,2.709947067660874,0.33655498193086253) q3,q2; rz(4.13723904279635) q2; ryy(4.53373905225224) q4,q0; ry(4.592811399760644) q0; ch q3,q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[1];
gate_P173 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
