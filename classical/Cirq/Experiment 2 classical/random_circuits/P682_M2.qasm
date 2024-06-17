OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.591201480884086) q1; cx q0,q1; h q1; }
gate gate_P682 q0,q1,q2,q3,q4 { rzx(1.591201480884086) q2,q1; cswap q0,q3,q4; cz q0,q1; cu3(4.565283038300194,0.9503732107471574,0.24492532851077403) q2,q4; p(4.647111154740632) q3; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[4];
gate_P682 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
