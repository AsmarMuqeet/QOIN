OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.699931709230376) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P394 q0,q1,q2,q3,q4 { sx q0; swap q2,q1; ryy(5.699931709230376) q0,q1; t q0; u3(4.270734298623702,2.900279960601329,4.870447452963741) q3; u2(3.6300147708224717,1.4049224372680011) q3; s q4; cy q4,q2; cu(3.5926950900678487,3.529250433810819,2.838619890454168,4.896455170307781) q1,q4; csx q2,q3; cx q2,q0; ccx q4,q3,q1; }
qreg q[5];
creg c[3];
ccx q[0],q[1],q[3];
gate_P394 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
