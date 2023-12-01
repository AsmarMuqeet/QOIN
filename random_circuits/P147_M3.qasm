OPENQASM 2.0;
include "qelib1.inc";
gate gate_P147 q0,q1,q2,q3,q4,q5,q6 { x q0; u2(4.278002456915702,5.170160944187396) q0; cp(4.348763496445571) q1,q4; s q1; rxx(4.449347312628605) q3,q5; cy q3,q4; x q5; cy q2,q6; h q2; y q6; }
qreg q[7];
creg c[3];
cx q[2],q[0];
gate_P147 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
