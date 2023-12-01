OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.132844857064035) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
sx q[1];
rzx(5.132844857064035) q[3],q[2];
rzz(0.7123371143069707) q[2],q[1];
sdg q[3];
cy q[4],q[0];
s q[0];
u1(2.2227100496561984) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
