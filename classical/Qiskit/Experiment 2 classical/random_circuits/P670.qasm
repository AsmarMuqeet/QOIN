OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.987638412323939) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
h q[1];
rx(0.10298325581278191) q[2];
cu(0.019698681080587248,5.402419040569006,5.650643396023282,3.464219648130298) q[1],q[2];
s q[3];
swap q[0],q[4];
y q[0];
rzx(0.987638412323939) q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
