OPENQASM 2.0;
include "qelib1.inc";
gate iswap q0,q1 { s q0; s q1; h q0; cx q0,q1; cx q1,q0; h q1; }
gate r(param0,param1) q0 { u3(5.617855478600885,3.9441978368246726,-3.9441978368246726) q0; }
qreg q[7];
creg c[3];
ry(1.599336714605351) q[0];
sdg q[0];
s q[2];
iswap q[3],q[4];
r(5.617855478600885,5.514994163619569) q[3];
rx(5.546065311721825) q[4];
cu3(3.392590327897171,4.908069905418638,0.142134287162965) q[5],q[1];
sxdg q[1];
tdg q[5];
z q[6];
csx q[6],q[2];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
