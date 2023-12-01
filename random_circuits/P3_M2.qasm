OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.800916866705247) q1; cx q0,q1; h q1; }
gate gate_P3 q0,q1,q2,q3,q4 { y q0; sdg q0; cz q2,q1; sx q1; swap q4,q3; u1(6.1646738992220715) q3; rzx(4.800916866705247) q4,q2; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[4];
gate_P3 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
