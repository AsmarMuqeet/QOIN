OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.535740405303414) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
s q[0];
s q[0];
h q[2];
u(4.979511112805606,4.627793400986392,3.308645805735046) q[2];
ryy(5.535740405303414) q[1],q[3];
sx q[1];
u(2.4859642814414977,4.726864402031602,1.9396012694196578) q[4];
rxx(6.26397866509747) q[4],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
