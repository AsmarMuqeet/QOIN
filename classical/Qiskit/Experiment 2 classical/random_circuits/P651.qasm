OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.7612047871025855) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
s q[2];
rz(4.468110148918584) q[2];
x q[2];
rzx(3.7612047871025855) q[0],q[3];
rx(5.716834207291609) q[3];
u2(4.0055155487368,3.792665346398875) q[3];
rzz(5.461618797521712) q[1],q[4];
csx q[1],q[0];
csx q[0],q[1];
y q[4];
ry(5.324838016933715) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
