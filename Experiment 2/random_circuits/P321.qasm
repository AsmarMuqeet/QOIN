OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
creg c[3];
y q[1];
z q[1];
y q[3];
cswap q[0],q[2],q[5];
cu3(1.5276010835137988,0.2934879341872796,2.038422309432966) q[3],q[0];
csx q[4],q[6];
swap q[2],q[4];
ch q[6],q[5];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
