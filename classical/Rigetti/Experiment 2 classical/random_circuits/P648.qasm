OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
qreg q[7];
creg c[3];
x q[1];
z q[1];
cswap q[4],q[0],q[2];
rxx(6.1956372096072725) q[2],q[0];
ry(4.334563268420471) q[5];
dcx q[6],q[3];
cry(5.9445624846173715) q[4],q[3];
crz(2.309948087338996) q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
