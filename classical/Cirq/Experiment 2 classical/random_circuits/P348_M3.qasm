OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.0972587500676985) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.645452894023021) q1; cx q0,q1; h q1; }
gate gate_P348 q0,q1,q2,q3,q4,q5,q6 { rzx(4.645452894023021) q1,q4; ryy(1.0972587500676985) q5,q0; cx q0,q1; u1(0.7496519704856015) q5; cswap q2,q6,q3; rx(4.731796712695868) q2; ccx q3,q6,q4; }
qreg q[7];
creg c[3];
cx q[0],q[2];
gate_P348 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
