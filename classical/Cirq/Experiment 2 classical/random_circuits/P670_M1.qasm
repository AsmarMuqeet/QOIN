OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.987638412323939) q1; cx q0,q1; h q1; }
gate gate_P670 q0,q1,q2,q3,q4 { h q1; rx(0.10298325581278191) q2; cu(0.019698681080587248,5.402419040569006,5.650643396023282,3.464219648130298) q1,q2; s q3; swap q0,q4; y q0; rzx(0.987638412323939) q4,q3; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[4];
gate_P670 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
