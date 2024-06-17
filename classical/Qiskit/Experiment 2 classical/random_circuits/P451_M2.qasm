OPENQASM 2.0;
include "qelib1.inc";
gate gate_P451 q0,q1,q2,q3,q4,q5,q6 { u3(2.671147991059713,1.6661958969125723,3.060296119463276) q0; sxdg q0; sxdg q2; h q3; y q3; u(1.6857869246092425,3.530180086279876,3.1325907910998456) q4; ccx q1,q6,q5; cswap q4,q1,q2; cy q6,q5; }
qreg q[7];
creg c[3];
cx q[1],q[0];
gate_P451 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
