OPENQASM 2.0;
include "qelib1.inc";
gate gate_P576 q0,q1,q2,q3,q4 { h q0; t q0; x q1; swap q3,q2; rx(1.6828543316270013) q2; cu1(3.3272559598968634) q3,q1; u2(2.8170656087827552,3.4033396580949646) q4; y q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P576 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
