OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(6.218991386112488) q1; cx q0,q1; h q1; }
gate gate_P910 q0,q1,q2,q3,q4 { ry(3.8625909152963076) q0; y q0; id q1; rz(2.2919032552351486) q1; id q2; tdg q2; rzx(6.218991386112488) q3,q4; dcx q3,q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P910 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
