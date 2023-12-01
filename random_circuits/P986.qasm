OPENQASM 2.0;
include "qelib1.inc";
gate xx_minus_yy(param0,param1) q0,q1 { rz(-4.1945725688651825) q1; rz(-pi/2) q0; sx q0; rz(pi/2) q0; s q1; cx q0,q1; ry(2.5374646864700683) q0; ry(-2.5374646864700683) q1; cx q0,q1; sdg q1; rz(-pi/2) q0; sxdg q0; rz(pi/2) q0; rz(4.1945725688651825) q1; }
qreg q[5];
creg c[3];
y q[0];
sxdg q[2];
cu(1.9536550184548396,3.489953751338244,1.107942188494853,1.9000550284256328) q[0],q[2];
sx q[3];
csx q[4],q[1];
x q[1];
xx_minus_yy(5.074929372940137,4.1945725688651825) q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
