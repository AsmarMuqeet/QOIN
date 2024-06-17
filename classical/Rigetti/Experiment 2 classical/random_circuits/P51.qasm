OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.9576198594471097) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[7];
creg c[3];
y q[0];
t q[1];
cx q[2],q[4];
cz q[2],q[1];
ryy(1.9576198594471097) q[4],q[0];
cx q[3],q[5];
u3(2.0197581854922864,4.515975522094034,0.5140209732530442) q[6];
cswap q[5],q[6],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
