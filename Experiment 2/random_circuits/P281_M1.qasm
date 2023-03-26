OPENQASM 2.0;
include "qelib1.inc";
gate xx_plus_yy(param0,param1) q0,q1 { rz(5.367743577587201) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-1.6457568453860214) q1; ry(-1.6457568453860214) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-5.367743577587201) q0; }
gate gate_P281 q0,q1,q2,q3,q4,q5,q6 { y q1; tdg q2; csx q1,q2; sxdg q4; cswap q0,q5,q3; x q0; rz(6.262192411419964) q3; y q5; sdg q6; xx_plus_yy(3.291513690772043,5.367743577587201) q4,q6; }
qreg q[7];
creg c[3];
cx q[2],q[1];
gate_P281 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
