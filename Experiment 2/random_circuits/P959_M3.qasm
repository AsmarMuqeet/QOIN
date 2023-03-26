OPENQASM 2.0;
include "qelib1.inc";
gate gate_P959 q0,q1,q2,q3,q4,q5,q6 { sdg q2; u1(1.2067219785461973) q3; csx q2,q3; cx q4,q1; cu(0.7379809657215951,4.7314786357402765,1.4356733907380748,5.446686603398934) q5,q0; ccx q0,q1,q4; u1(4.0803672293476) q5; y q6; tdg q6; }
qreg q[7];
creg c[3];
cx q[0],q[2];
gate_P959 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
