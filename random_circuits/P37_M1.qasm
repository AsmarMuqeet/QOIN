OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.04048466520045553) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P37 q0,q1,q2,q3,q4 { ry(2.900301310329124) q1; cp(3.8676437975863305) q2,q0; tdg q0; cu(0.8480526322841674,2.54083313983609,1.3579155822378748,4.624713284420958) q3,q4; cx q1,q3; ryy(0.04048466520045553) q2,q4; cswap q1,q3,q4; swap q2,q0; }
qreg q[5];
creg c[3];
cx q[0],q[2];
gate_P37 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
