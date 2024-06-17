OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.970856972532493) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P251 q0,q1,q2,q3,q4 { id q0; cswap q3,q1,q2; cu1(3.9276506847228636) q0,q2; u3(5.978585409806185,3.2864808040511955,3.0310689839571894) q3; u(6.0414299133351514,5.305462568726702,3.0049435870567986) q4; ryy(5.970856972532493) q1,q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P251 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
