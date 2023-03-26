OPENQASM 2.0;
include "qelib1.inc";
gate gate_P832 q0,q1,q2,q3,q4 { sxdg q1; rxx(3.0173780493748414) q0,q2; id q0; y q3; rz(1.845199422692302) q3; p(4.862504347322253) q4; ccx q2,q4,q1; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P832 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
