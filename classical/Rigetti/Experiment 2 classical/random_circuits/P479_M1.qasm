OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.799331784112715) q1; cx q0,q1; h q1; }
gate gate_P479 q0,q1,q2,q3,q4,q5,q6 { y q1; x q2; rz(3.8827945182702543) q4; cu(5.469158760747419,5.131025994573877,4.671299127423562,5.572383676345489) q0,q5; cx q0,q4; id q5; rzx(2.799331784112715) q6,q3; cswap q3,q1,q2; sx q6; }
qreg q[7];
creg c[3];
ccx q[1],q[2],q[3];
gate_P479 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
