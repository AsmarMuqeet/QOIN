OPENQASM 2.0;
include "qelib1.inc";
gate gate_P458 q0,q1,q2,q3,q4 { cx q1,q0; cu(5.189528561122808,5.511665508049899,3.380209392389156,3.7605437495555516) q0,q1; sx q3; swap q2,q4; u1(4.847347591911824) q2; cx q3,q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P458 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
