OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(4.0047612748398755) q1; cx q0,q1; h q1; }
gate gate_P854 q0,q1,q2,q3,q4 { rz(3.844463926315479) q0; swap q2,q1; s q2; s q3; rzx(4.0047612748398755) q1,q3; swap q1,q2; s q3; sxdg q4; cu(1.463461189635545,2.5089188735381693,4.789504776437685,0.16273080283019276) q4,q0; swap q0,q4; }
qreg q[5];
creg c[3];
cx q[1],q[2];
gate_P854 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
