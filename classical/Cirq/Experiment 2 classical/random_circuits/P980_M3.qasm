OPENQASM 2.0;
include "qelib1.inc";
gate gate_P980 q0,q1,q2,q3,q4 { rx(1.8518762559618929) q0; s q0; u3(1.033892868068064,1.3016292363266586,1.6908715811517456) q2; id q3; z q3; swap q4,q1; cz q2,q1; h q4; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P980 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
