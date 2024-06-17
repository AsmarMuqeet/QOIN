OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.018769132766922) q1; cx q0,q1; h q1; }
gate gate_P113 q0,q1,q2,q3,q4 { tdg q2; u2(6.110988350444743,3.661627809260133) q2; cp(1.869195724867897) q3,q1; rz(5.591262805640974) q1; rzx(4.018769132766922) q4,q0; sxdg q0; rzz(4.626540839188073) q3,q4; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[2];
gate_P113 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
