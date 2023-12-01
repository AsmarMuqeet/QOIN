OPENQASM 2.0;
include "qelib1.inc";
gate gate_P426 q0,q1,q2,q3,q4 { rx(6.177455328827261) q1; sxdg q1; x q1; id q2; ry(2.2341045681757588) q2; cu1(4.274049946405798) q3,q0; x q3; rzz(5.992689061867026) q2,q3; u1(3.9137567243478197) q4; rxx(4.358100667980117) q0,q4; sxdg q0; ry(1.2548892301488759) q4; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[0];
gate_P426 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
