OPENQASM 2.0;
include "qelib1.inc";
gate gate_P536 q0,q1,q2,q3,q4 { u2(4.524420566247562,0.17316495978425123) q0; u3(4.282234160821216,4.090470171794908,3.23833904254036) q1; t q1; csx q3,q2; rxx(3.8174962767199068) q0,q2; h q3; u1(3.246741164678123) q4; s q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[1];
gate_P536 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
