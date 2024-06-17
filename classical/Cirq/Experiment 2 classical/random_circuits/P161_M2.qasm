OPENQASM 2.0;
include "qelib1.inc";
gate gate_P161 q0,q1,q2,q3,q4 { sdg q1; y q2; cu(3.660209901070843,1.1406970191211667,4.595127085045611,1.512479566632271) q3,q0; ccx q2,q0,q1; t q4; swap q4,q3; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P161 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
