OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.517296631338176) q1; cx q0,q1; h q1; }
gate gate_P437 q0,q1,q2,q3,q4,q5,q6 { h q0; x q0; tdg q2; u(3.030049599751374,1.2478560269876926,4.003044216478653) q2; swap q4,q3; rzx(5.517296631338176) q1,q5; cy q4,q1; t q5; sdg q6; cu3(1.5429204571431976,5.177862623965174,1.3706737652081882) q3,q6; }
qreg q[7];
creg c[3];
ccx q[0],q[2],q[3];
gate_P437 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
