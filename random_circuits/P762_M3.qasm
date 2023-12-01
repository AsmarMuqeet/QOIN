OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(3.0248113698453585) q1; cx q0,q1; h q1; }
gate gate_P762 q0,q1,q2,q3,q4 { ccx q1,q2,q3; h q1; u2(0.9787768842410906,4.899485181811682) q2; cx q4,q0; rzx(3.0248113698453585) q0,q3; id q4; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P762 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
