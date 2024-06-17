OPENQASM 2.0;
include "qelib1.inc";
gate gate_P902 q0,q1,q2,q3,q4 { u3(1.1118977117142166,1.3936002928435476,1.6042616407189747) q1; ccx q3,q2,q0; s q0; y q2; p(0.6639465934288189) q3; y q4; cx q4,q1; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P902 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
