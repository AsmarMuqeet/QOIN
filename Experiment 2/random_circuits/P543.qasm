OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(3.6919244698707034,1.1426032389545986,-1.1426032389545986) q0; }
qreg q[7];
creg c[3];
h q[0];
r(3.6919244698707034,2.713399565749495) q[0];
u1(5.6264222909525605) q[1];
sx q[1];
sxdg q[2];
ry(0.22567070700907702) q[2];
x q[3];
y q[3];
tdg q[4];
tdg q[4];
rzz(1.6735482090892029) q[5],q[6];
rzz(5.9656328335325135) q[6],q[5];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
