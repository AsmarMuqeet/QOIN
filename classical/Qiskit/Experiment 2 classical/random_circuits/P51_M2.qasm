OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(1.9576198594471097) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P51 q0,q1,q2,q3,q4,q5,q6 { y q0; t q1; cx q2,q4; cz q2,q1; ryy(1.9576198594471097) q4,q0; cx q3,q5; u3(2.0197581854922864,4.515975522094034,0.5140209732530442) q6; cswap q5,q6,q3; }
qreg q[7];
creg c[3];
ccx q[0],q[2],q[4];
gate_P51 q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
