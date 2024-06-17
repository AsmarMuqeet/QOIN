OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.33043056293670625) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
x q[0];
y q[0];
rzx(0.33043056293670625) q[3],q[2];
u3(1.9793689249736175,5.22429863737089,6.124583104181602) q[2];
rz(4.839206949252805) q[3];
cu1(0.7521506698480848) q[1],q[4];
y q[1];
s q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
