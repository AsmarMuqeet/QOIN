OPENQASM 2.0;
include "qelib1.inc";
gate xx_plus_yy(param0,param1) q0,q1 { rz(5.367743577587201) q0; rz(-pi/2) q1; sx q1; rz(pi/2) q1; s q0; cx q1,q0; ry(-1.6457568453860214) q1; ry(-1.6457568453860214) q0; cx q1,q0; sdg q0; rz(-pi/2) q1; sxdg q1; rz(pi/2) q1; rz(-5.367743577587201) q0; }
qreg q[7];
creg c[3];
y q[1];
tdg q[2];
csx q[1],q[2];
sxdg q[4];
cswap q[0],q[5],q[3];
x q[0];
rz(6.262192411419964) q[3];
y q[5];
sdg q[6];
xx_plus_yy(3.291513690772043,5.367743577587201) q[4],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
