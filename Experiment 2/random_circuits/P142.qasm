OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
p(0.5888971734414324) q[0];
ry(0.7756321114617226) q[0];
id q[0];
t q[3];
cswap q[2],q[4],q[1];
csx q[2],q[1];
ry(4.298488243656001) q[1];
x q[1];
cz q[4],q[3];
cx q[2],q[4];
u2(5.111522593146095,3.8473357145978704) q[2];
sx q[3];
cswap q[0],q[3],q[4];
cx q[0],q[1];
cy q[2],q[4];
u(5.334552379254792,6.097844910813695,2.818854685584165) q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
