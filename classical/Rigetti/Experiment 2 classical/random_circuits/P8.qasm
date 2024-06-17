OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.869428726888762) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
u3(3.2486068679853926,6.280402533406441,4.976618389239407) q[1];
ryy(5.869428726888762) q[2],q[0];
x q[2];
rz(3.1577934235320013) q[3];
cswap q[1],q[0],q[3];
p(0.9041350184361134) q[4];
t q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
