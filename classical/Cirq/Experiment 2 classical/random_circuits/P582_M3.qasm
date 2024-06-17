OPENQASM 2.0;
include "qelib1.inc";
gate gate_P582 q0,q1,q2,q3,q4 { id q0; t q0; rz(5.695455692172045) q1; sdg q1; id q2; y q3; u3(3.694991651929714,1.7263395661343244,2.0266517889450513) q3; u1(3.2457558856576654) q4; rxx(3.204131665266578) q2,q4; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P582 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
