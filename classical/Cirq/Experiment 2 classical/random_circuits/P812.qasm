OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(5.144131182804247,-0.9955579743213062,0.9955579743213062) q0; }
qreg q[5];
creg c[3];
tdg q[0];
z q[0];
t q[3];
r(5.144131182804247,0.5752383524735903) q[3];
ccx q[2],q[4],q[1];
y q[1];
rz(0.8421624314691512) q[2];
rx(0.5905983046688563) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
