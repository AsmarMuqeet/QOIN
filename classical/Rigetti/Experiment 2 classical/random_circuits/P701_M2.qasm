OPENQASM 2.0;
include "qelib1.inc";
gate gate_P701 q0,q1,q2,q3,q4 { u1(3.41014257012256) q1; s q1; u1(3.198688584165524) q2; id q3; csx q0,q4; rzz(3.0032037734043153) q2,q4; cu1(1.671661832646775) q3,q0; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P701 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
