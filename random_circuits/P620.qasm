OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(0.5460834975610918,4.297285772181305,-4.297285772181305) q0; }
qreg q[7];
creg c[3];
r(0.5460834975610918,5.868082098976202) q[1];
u2(2.533443318027567,5.789099208555089) q[1];
sdg q[2];
swap q[0],q[3];
sx q[0];
z q[4];
s q[4];
cz q[5],q[6];
cswap q[3],q[6],q[2];
u3(3.4439503460625343,6.258979833676326,4.770831165508421) q[5];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];