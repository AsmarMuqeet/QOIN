OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.9315741110685494) q1; cx q0,q1; h q1; }
gate xx_minus_yy(param0,param1) q0,q1 { rz(-4.0196943084105445) q1; rz(-pi/2) q0; sx q0; rz(pi/2) q0; s q1; cx q0,q1; ry(0.42786481561023537) q0; ry(-0.42786481561023537) q1; cx q0,q1; sdg q1; rz(-pi/2) q0; sxdg q0; rz(pi/2) q0; rz(4.0196943084105445) q1; }
gate rzx_139921316174384(param0) q0,q1 { h q1; cx q0,q1; rz(5.640844612845155) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
x q[0];
sdg q[0];
y q[0];
tdg q[2];
u1(0.1654095190099453) q[3];
rx(2.2386384733580895) q[3];
y q[5];
ccx q[4],q[1],q[6];
rzx(1.9315741110685494) q[2],q[1];
cswap q[6],q[4],q[5];
rxx(0.1405167834716918) q[1],q[6];
xx_minus_yy(0.8557296312204707,4.0196943084105445) q[3],q[4];
rzx_139921316174384(5.640844612845155) q[5],q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
