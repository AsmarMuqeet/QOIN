OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
creg c[3];
y q[2];
u(4.170445420127611,2.417051980753239,1.6312403162205453) q[2];
p(1.3296593207725305) q[3];
z q[3];
rzz(4.507342194457834) q[5],q[0];
rzz(4.339026383799123) q[5],q[0];
ccx q[1],q[4],q[6];
x q[1];
crz(0.6894401737172741) q[4],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
