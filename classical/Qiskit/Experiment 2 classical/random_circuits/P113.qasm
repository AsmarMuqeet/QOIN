OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.018769132766922) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
tdg q[2];
u2(6.110988350444743,3.661627809260133) q[2];
cp(1.869195724867897) q[3],q[1];
rz(5.591262805640974) q[1];
rzx(4.018769132766922) q[4],q[0];
sxdg q[0];
rzz(4.626540839188073) q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
