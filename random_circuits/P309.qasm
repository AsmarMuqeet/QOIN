OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.03324727129348661) q1; cx q0,q1; h q1; }
gate xx_plus_yy(param0,param1) q0,q1 { rz(1.98569244443009) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-0.7680677440068918) q1; ry(-0.7680677440068918) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-1.98569244443009) q0; }
qreg q[5];
creg c[3];
x q[0];
rzx(0.03324727129348661) q[2],q[1];
ccx q[2],q[0],q[1];
sx q[0];
id q[1];
p(0.785625823330962) q[2];
xx_plus_yy(1.5361354880137836,1.98569244443009) q[4],q[3];
tdg q[3];
id q[4];
cz q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
