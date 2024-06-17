OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.7319316874210515) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P450 q0,q1,q2,q3,q4,q5,q6 { t q0; h q1; t q1; s q3; ryy(0.7319316874210515) q3,q0; u2(3.961207861262608,6.119172083958897) q4; h q5; ry(0.6489398674022544) q5; cz q6,q2; csx q4,q2; sxdg q6; }
qreg q[7];
creg c[3];
ccx q[2],q[1],q[4];
gate_P450 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
