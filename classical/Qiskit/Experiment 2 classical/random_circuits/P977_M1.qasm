OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
gate gate_P977 q0,q1,q2,q3,q4 { sx q0; rz(5.922427412017494) q0; sx q1; cy q2,q3; cp(3.032659045189557) q2,q1; p(1.5908086896956184) q4; dcx q4,q3; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[3];
gate_P977 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
