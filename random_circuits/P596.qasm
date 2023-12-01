OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.0805129105597222) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
u1(1.9033044593063182) q[0];
x q[1];
x q[1];
u1(1.2246592733443564) q[3];
ryy(1.0805129105597222) q[0],q[3];
csx q[2],q[4];
sdg q[2];
u2(5.0291913583863295,6.046708028836978) q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
