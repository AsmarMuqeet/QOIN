OPENQASM 2.0;
include "qelib1.inc";
gate xx_minus_yy(param0,param1) q0,q1 { rz(-5.389484381985331) q1; rz(-pi/2) q0; sx q0; rz(pi/2) q0; s q1; cx q0,q1; ry(1.1275947552118837) q0; ry(-1.1275947552118837) q1; cx q0,q1; sdg q1; rz(-pi/2) q0; sxdg q0; rz(pi/2) q0; rz(5.389484381985331) q1; }
qreg q[7];
creg c[3];
cu(2.7487139889663625,3.105619362819415,1.227551149261588,0.6795541878929334) q[0],q[2];
z q[3];
cu3(1.7948424258552504,2.194078257107788,0.34161824813369407) q[4],q[1];
ccx q[2],q[0],q[1];
id q[4];
cy q[5],q[6];
xx_minus_yy(2.2551895104237674,5.389484381985331) q[5],q[3];
s q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];