OPENQASM 2.0;
include "qelib1.inc";
gate gate_P872 q0,q1,q2,q3,q4 { s q1; cy q0,q2; cu(3.9615815297424892,4.598201761778255,0.04863595519375005,2.927332459994593) q2,q1; sxdg q3; sdg q3; u1(2.4140286188181204) q4; cz q0,q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[3];
gate_P872 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
