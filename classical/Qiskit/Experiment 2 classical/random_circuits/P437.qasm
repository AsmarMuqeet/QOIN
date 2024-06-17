OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.517296631338176) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
h q[0];
x q[0];
tdg q[2];
u(3.030049599751374,1.2478560269876926,4.003044216478653) q[2];
swap q[4],q[3];
rzx(5.517296631338176) q[1],q[5];
cy q[4],q[1];
t q[5];
sdg q[6];
cu3(1.5429204571431976,5.177862623965174,1.3706737652081882) q[3],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
