OPENQASM 2.0;
include "qelib1.inc";
gate gate_P744 q0,q1,q2,q3,q4 { y q1; cu3(0.15864462940498755,1.8899756342358114,4.564912451700428) q0,q2; cswap q2,q0,q1; cy q3,q4; crx(4.738545111236363) q3,q4; }
qreg q[5];
creg c[3];
ccx q[0],q[2],q[4];
gate_P744 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
