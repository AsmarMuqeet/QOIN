OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.2894444149551456) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate xx_plus_yy(param0,param1) q0,q1 { rz(1.609259247550925) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-1.0610281812512616) q1; ry(-1.0610281812512616) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-1.609259247550925) q0; }
qreg q[5];
creg c[3];
cswap q[3],q[1],q[0];
h q[0];
rz(5.657025135234319) q[3];
rxx(3.887341789777101) q[0],q[3];
ryy(1.2894444149551456) q[2],q[4];
cp(4.354807196184324) q[2],q[1];
x q[2];
cx q[2],q[3];
y q[2];
sxdg q[4];
rxx(0.8662579377719828) q[1],q[4];
sx q[1];
sx q[1];
rzz(3.0565260331803072) q[4],q[0];
s q[0];
xx_plus_yy(2.1220563625025233,1.609259247550925) q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
