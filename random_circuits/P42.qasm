OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.8319814324361177) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
u1(1.1432318495559204) q[1];
s q[1];
x q[2];
sx q[2];
rzx(0.8319814324361177) q[0],q[3];
y q[0];
h q[3];
id q[4];
ry(3.0637990324899174) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
