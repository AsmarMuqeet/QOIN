OPENQASM 2.0;
include "qelib1.inc";
gate gate_P558 q0,q1,q2,q3,q4,q5,q6 { rz(3.3059190253033863) q0; cu1(3.3272129690872703) q3,q1; cy q4,q2; cz q0,q4; rx(1.844772256917789) q5; cu(1.147596084622047,0.9403919712845819,2.209386349705091,4.6155928524739975) q5,q2; tdg q6; ccx q6,q1,q3; }
qreg q[7];
creg c[3];
cx q[0],q[1];
gate_P558 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
