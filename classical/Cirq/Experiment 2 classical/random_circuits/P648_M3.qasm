OPENQASM 2.0;
include "qelib1.inc";
gate dcx q0,q1 { cx q0,q1; cx q1,q0; }
gate gate_P648 q0,q1,q2,q3,q4,q5,q6 { x q1; z q1; cswap q4,q0,q2; rxx(6.1956372096072725) q2,q0; ry(4.334563268420471) q5; dcx q6,q3; cry(5.9445624846173715) q4,q3; crz(2.309948087338996) q5,q6; }
qreg q[7];
creg c[3];
ccx q[1],q[2],q[4];
gate_P648 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
