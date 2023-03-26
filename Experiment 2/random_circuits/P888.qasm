OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
qreg q[7];
creg c[3];
id q[2];
s q[2];
ccx q[4],q[3],q[1];
z q[3];
cz q[0],q[5];
cz q[1],q[0];
dcx q[4],q[5];
sdg q[6];
z q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
