OPENQASM 2.0;
include "qelib1.inc";
gate gate_P613 q0,q1,q2,q3,q4,q5,q6 { ry(2.0359242628051843) q0; swap q1,q2; cz q1,q0; rz(3.854856977891439) q2; p(3.9692474214366937) q3; rz(4.711034432172845) q5; cu3(1.4315251194359222,0.005874251519354808,5.634294078768533) q4,q6; rccx q3,q6,q5; sxdg q4; }
qreg q[7];
creg c[3];
ccx q[0],q[2],q[3];
gate_P613 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
