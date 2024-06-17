OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(6.193831933256437) q1; cx q0,q1; h q1; }
gate gate_P77 q0,q1,q2,q3,q4 { rzx(6.193831933256437) q2,q1; u(5.4357166044394125,0.9509529562694639,4.560556242866193) q2; cp(1.6920447144743973) q3,q0; z q0; cz q3,q1; rz(3.8329218114908903) q4; z q4; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[3];
gate_P77 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
