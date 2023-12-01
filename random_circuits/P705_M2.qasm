OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.519598550476005) q1; cx q0,q1; h q1; }
gate gate_P705 q0,q1,q2,q3,q4,q5,q6 { t q0; p(0.5811326432322553) q0; u2(5.7525905621161675,1.2410485398072852) q0; u1(0.3033351938234144) q1; u2(3.201389314106716,1.744068087488444) q2; z q3; rz(2.826866521452688) q3; y q4; cp(1.3253264863960643) q6,q5; cswap q5,q1,q4; tdg q1; rzx(2.519598550476005) q4,q3; sxdg q5; cz q6,q2; cy q6,q2; }
qreg q[7];
creg c[3];
ccx q[1],q[0],q[3];
gate_P705 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
