OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.3537529786715996) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P288 q0,q1,q2,q3,q4,q5,q6 { s q1; rx(2.8504581189837017) q1; u1(1.356714493259729) q3; t q4; u3(2.5920708653492976,5.443512506484792,5.9820271304295725) q4; cswap q5,q0,q2; cswap q0,q5,q2; ryy(1.3537529786715996) q0,q4; rz(4.157178453634468) q2; y q5; ry(3.1435217137500646) q6; cy q6,q3; y q3; cu1(0.5339705990274877) q6,q1; }
qreg q[7];
creg c[3];
cx q[1],q[2];
gate_P288 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
