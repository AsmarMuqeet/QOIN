OPENQASM 2.0;
include "qelib1.inc";
gate gate_P850 q0,q1,q2,q3,q4 { t q1; x q1; u1(5.523430125652327) q2; cu(5.501061834114119,6.073477550849639,4.897442770414286,0.7650773908063062) q0,q3; rzz(4.676587448755616) q2,q0; u(1.2821293394400066,1.1477403334390652,4.014823114938507) q3; tdg q4; p(1.6421035102477965) q4; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P850 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
