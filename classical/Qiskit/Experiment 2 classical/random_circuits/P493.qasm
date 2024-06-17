OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.6008166196882856) q1; cx q0,q1; h q1; }
qreg q[5];
creg c[3];
rz(1.2002563807186055) q[1];
t q[1];
ry(4.161410614630265) q[2];
cswap q[4],q[0],q[3];
rzx(2.6008166196882856) q[0],q[2];
s q[3];
u(2.8610710514370177,2.6106505173776573,4.533829395292149) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
