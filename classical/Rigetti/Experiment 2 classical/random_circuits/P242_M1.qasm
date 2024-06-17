OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.9554675659697328,-0.3988887687172029,0.3988887687172029) q0; }
gate gate_P242 q0,q1,q2,q3,q4 { cswap q1,q0,q2; csx q1,q2; x q3; r(0.9554675659697328,1.1719075580776936) q3; s q4; csx q0,q4; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[1];
gate_P242 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
