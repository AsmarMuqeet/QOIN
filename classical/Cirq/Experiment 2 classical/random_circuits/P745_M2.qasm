OPENQASM 2.0;
include "qelib1.inc";
gate gate_P745 q0,q1,q2,q3,q4 { tdg q0; cx q1,q2; id q2; cp(3.315979168530919) q3,q4; cu3(3.9730560087761195,5.935830250992275,3.787974478439733) q3,q0; cz q4,q1; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[0];
gate_P745 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
