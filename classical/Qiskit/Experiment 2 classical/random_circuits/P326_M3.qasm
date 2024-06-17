OPENQASM 2.0;
include "qelib1.inc";
gate gate_P326 q0,q1,q2,q3,q4 { rzz(5.862287332516937) q1,q0; ry(2.4748638706284702) q0; u2(2.1257794851890632,2.368347422952444) q1; z q2; tdg q2; cp(2.3697695578787017) q3,q4; cx q4,q3; }
qreg q[5];
creg c[3];
ccx q[1],q[2],q[3];
gate_P326 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
