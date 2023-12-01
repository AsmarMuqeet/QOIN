OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(6.218991386112488) q1; cx q0,q1; h q1; }
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
qreg q[5];
creg c[3];
ry(3.8625909152963076) q[0];
y q[0];
id q[1];
rz(2.2919032552351486) q[1];
id q[2];
tdg q[2];
rzx(6.218991386112488) q[3],q[4];
dcx q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
