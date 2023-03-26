OPENQASM 2.0;
include "qelib1.inc";
gate gate_P886 q0,q1,q2,q3,q4 { id q0; csx q2,q3; cu1(4.675382443249583) q2,q0; cu(2.8479221585009107,2.538036727017504,2.2226453454195627,2.41846538211652) q1,q4; u1(2.040742683702517) q1; ch q3,q4; }
qreg q[5];
creg c[3];
cx q[2],q[1];
gate_P886 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
