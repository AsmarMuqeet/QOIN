OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
u2(5.532501483412052,3.4969168165438833) q[1];
h q[1];
cu3(1.672362648138323,5.6894289097744,3.607639114663848) q[3],q[2];
u1(2.9819573456138517) q[2];
u3(2.1806567711533678,3.390568181041167,2.2651009956120935) q[3];
cy q[4],q[0];
id q[0];
z q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];