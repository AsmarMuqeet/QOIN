OPENQASM 2.0;
include "qelib1.inc";
gate gate_P328 q0,q1,q2,q3,q4 { cz q1,q0; y q1; u1(5.242339282124736) q3; cz q2,q4; cu(3.8582116430069355,0.9495956416240754,0.8819983396855613,1.4273502390162356) q2,q0; ch q3,q4; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[2];
gate_P328 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
