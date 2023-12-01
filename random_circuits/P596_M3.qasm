OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.0805129105597222) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P596 q0,q1,q2,q3,q4 { u1(1.9033044593063182) q0; x q1; x q1; u1(1.2246592733443564) q3; ryy(1.0805129105597222) q0,q3; csx q2,q4; sdg q2; u2(5.0291913583863295,6.046708028836978) q4; }
qreg q[5];
creg c[3];
cx q[0],q[1];
gate_P596 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
