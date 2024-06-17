OPENQASM 2.0;
include "qelib1.inc";
gate gate_P660 q0,q1,q2,q3,q4 { sxdg q0; p(1.7689908973380943) q0; rz(0.6270008267228586) q1; x q1; cswap q2,q3,q4; u(0.1354167649428375,4.874148777479807,6.215642929116083) q3; cu1(6.239949666168705) q4,q2; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P660 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
