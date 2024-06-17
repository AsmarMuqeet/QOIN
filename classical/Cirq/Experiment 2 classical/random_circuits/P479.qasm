OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(2.799331784112715) q1; cx q0,q1; h q1; }
qreg q[7];
creg c[3];
y q[1];
x q[2];
rz(3.8827945182702543) q[4];
cu(5.469158760747419,5.131025994573877,4.671299127423562,5.572383676345489) q[0],q[5];
cx q[0],q[4];
id q[5];
rzx(2.799331784112715) q[6],q[3];
cswap q[3],q[1],q[2];
sx q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
