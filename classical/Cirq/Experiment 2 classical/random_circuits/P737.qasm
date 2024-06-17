OPENQASM 2.0;
include "qelib1.inc";
gate xx_plus_yy(param0,param1) q0,q1 { rz(3.4043504880823336) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-0.936467102688003) q1; ry(-0.936467102688003) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-3.4043504880823336) q0; }
qreg q[5];
creg c[3];
t q[0];
p(2.9315734357982226) q[1];
cu3(3.712927600199872,1.5077579564709245,4.25714781529538) q[0],q[1];
rx(1.7284571687148926) q[3];
cy q[2],q[4];
y q[2];
xx_plus_yy(1.872934205376006,3.4043504880823336) q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
