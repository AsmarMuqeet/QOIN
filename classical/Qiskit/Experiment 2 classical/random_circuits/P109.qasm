OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.6862737671886613) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[2];
p(3.7717080359252693) q[1];
cz q[3],q[4];
rxx(3.0698006603745003) q[0],q[4];
cp(0.4886508001740852) q[3],q[2];
csx q[0],q[3];
ryy(0.6862737671886613) q[2],q[1];
u2(4.53318423782322,6.024355043978994) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
