OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(0.04048466520045553) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
ry(2.900301310329124) q[1];
cp(3.8676437975863305) q[2],q[0];
tdg q[0];
cu(0.8480526322841674,2.54083313983609,1.3579155822378748,4.624713284420958) q[3],q[4];
cx q[1],q[3];
ryy(0.04048466520045553) q[2],q[4];
cswap q[1],q[3],q[4];
swap q[2],q[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
