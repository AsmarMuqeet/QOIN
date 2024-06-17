OPENQASM 2.0;
include "qelib1.inc";
gate r_139921318359872(param0,param1) q0 { u3(1.0639830648401558,-1.2522691150511687,1.2522691150511687) q0; }
gate r(param0,param1) q0 { u3(5.185635146534417,-0.44954519137823357,0.44954519137823357) q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.9837414663612942) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
csx q[2],q[3];
sxdg q[3];
u(1.5110737915762695,0.8185124983199505,4.432318691138972) q[4];
u(2.003011048145534,5.864403116524728,4.57537986976354) q[4];
r_139921318359872(1.0639830648401558,0.31852721174372794) q[4];
r(5.185635146534417,1.121251135416663) q[5];
cswap q[0],q[1],q[6];
rzx(3.9837414663612942) q[2],q[1];
sx q[1];
swap q[5],q[0];
ccx q[0],q[2],q[3];
u1(5.276489868748074) q[5];
tdg q[6];
z q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];