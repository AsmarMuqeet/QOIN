OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(1.591201480884086) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
rzx(1.591201480884086) q[2],q[1];
cswap q[0],q[3],q[4];
cz q[0],q[1];
cu3(4.565283038300194,0.9503732107471574,0.24492532851077403) q[2],q[4];
p(4.647111154740632) q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
