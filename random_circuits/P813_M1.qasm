OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
gate gate_P813 q0,q1,q2,q3,q4,q5,q6 { rx(6.003508312943031) q0; rx(4.112487664306497) q1; cu1(6.159836845724382) q0,q1; h q2; sxdg q2; z q4; z q4; rz(4.374611594384175) q5; dcx q6,q3; cy q5,q3; y q6; }
qreg q[7];
creg c[3];
ccx q[0],q[2],q[1];
gate_P813 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
