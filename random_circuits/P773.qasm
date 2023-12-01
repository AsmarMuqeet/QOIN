OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(6.201080709091957) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
tdg q[0];
tdg q[1];
rz(5.835715705024645) q[1];
rzx(6.201080709091957) q[2],q[3];
u2(5.745828520409089,4.542205217778856) q[2];
sxdg q[5];
cp(5.075489137814696) q[5],q[0];
csx q[6],q[4];
cz q[3],q[6];
u(1.4491055538491333,5.478815312464114,0.5285619164337019) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
