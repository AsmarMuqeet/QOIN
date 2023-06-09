OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(4.53373905225224) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
x q[0];
x q[1];
rz(2.0892611651942157) q[1];
ccx q[2],q[4],q[3];
csx q[0],q[4];
p(4.112706188531515) q[0];
x q[2];
cy q[2],q[4];
s q[3];
cu1(1.9115531619602948) q[3],q[1];
sx q[1];
id q[1];
cu(4.435072052601562,3.8968735190926895,2.709947067660874,0.33655498193086253) q[3],q[2];
rz(4.13723904279635) q[2];
ryy(4.53373905225224) q[4],q[0];
ry(4.592811399760644) q[0];
ch q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
