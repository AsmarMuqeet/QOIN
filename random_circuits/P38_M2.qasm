OPENQASM 2.0;
include "qelib1.inc";
gate gate_P38 q0,q1,q2,q3,q4 { csx q0,q2; id q2; ccx q1,q4,q3; cu3(4.197363389379053,4.457104472475468,2.3246795290589013) q0,q4; ry(0.8210904509984704) q1; h q3; }
qreg q[5];
creg c[3];
cx q[1],q[0];
gate_P38 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
