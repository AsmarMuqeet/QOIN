OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(5.548835990637423) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
x q[0];
id q[1];
x q[3];
cswap q[1],q[0],q[3];
t q[1];
h q[3];
swap q[2],q[4];
rx(1.7636668374347335) q[2];
h q[2];
rxx(3.727127021944939) q[2],q[3];
sx q[4];
cz q[0],q[4];
rzx(5.548835990637423) q[0],q[1];
tdg q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
