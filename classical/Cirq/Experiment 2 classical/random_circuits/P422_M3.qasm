OPENQASM 2.0;
include "qelib1.inc";
gate r(param0,param1) q0 { u3(3.38850926679373,0.6569363322880317,-0.6569363322880317) q0; }
gate gate_P422 q0,q1,q2,q3,q4 { p(3.0852893729944983) q0; z q0; sxdg q1; sx q3; s q3; z q3; h q3; cp(1.3273677980495975) q2,q4; cswap q2,q1,q4; cswap q2,q1,q0; r(3.38850926679373,2.2277326590829283) q0; y q4; ccx q2,q4,q1; }
qreg q[5];
creg c[3];
ccx q[2],q[1],q[4];
gate_P422 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
