OPENQASM 2.0;
include "qelib1.inc";
gate gate_P717 q0,q1,q2,q3,q4 { rz(1.11881952200147) q0; ccx q2,q1,q3; u(4.831422133259609,3.822045660845887,2.645760794547443) q2; cx q3,q1; u2(3.9186963242679935,4.413926692727772) q4; rzz(0.4956250815676934) q0,q4; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P717 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
