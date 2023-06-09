OPENQASM 2.0;
include "qelib1.inc";
gate gate_P580 q0,q1,q2,q3,q4 { cu3(5.675235233075043,0.23703667247012147,3.1309839877219177) q1,q2; tdg q1; swap q3,q0; cx q2,q3; rz(0.21640729668719116) q4; cu(0.15809328658514615,6.25898024394458,4.1870570703992245,2.1662544272484743) q4,q0; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P580 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
