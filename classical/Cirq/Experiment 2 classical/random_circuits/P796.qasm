OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];
creg c[3];
u3(2.032617836944137,0.5557690402614933,1.2097335482692577) q[0];
sx q[1];
rxx(3.125664379111282) q[0],q[1];
rx(2.865762731148084) q[2];
p(2.762618699654722) q[3];
csx q[3],q[2];
u1(3.3049732322033134) q[4];
z q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];