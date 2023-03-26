OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
qreg q[5];
creg c[3];
sx q[0];
rz(5.922427412017494) q[0];
sx q[1];
cy q[2],q[3];
cp(3.032659045189557) q[2],q[1];
p(1.5908086896956184) q[4];
dcx q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
