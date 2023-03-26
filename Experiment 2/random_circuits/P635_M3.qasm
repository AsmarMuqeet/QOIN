OPENQASM 2.0;
include "qelib1.inc";
gate gate_P635 q0,q1,q2,q3,q4,q5,q6 { swap q1,q2; rx(5.022144160777682) q2; cx q0,q3; cswap q6,q4,q5; cswap q1,q0,q6; crx(1.8572648220243437) q4,q3; u(1.9146412565052349,2.584992258145499,3.3523560966007726) q5; }
qreg q[7];
creg c[3];
cx q[0],q[1];
gate_P635 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
