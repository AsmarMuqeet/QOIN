OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.800916866705247) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
y q[0];
sdg q[0];
cz q[2],q[1];
sx q[1];
swap q[4],q[3];
u1(6.1646738992220715) q[3];
rzx(4.800916866705247) q[4],q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
