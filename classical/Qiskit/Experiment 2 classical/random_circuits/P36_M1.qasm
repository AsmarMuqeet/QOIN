OPENQASM 2.0;
include "qelib1.inc";
gate rzx(param0) q0,q1 { h q1; cx q0,q1; rz(0.011432953277890496) q1; cx q0,q1; h q1; }
gate gate_P36 q0,q1,q2,q3,q4 { cz q1,q2; h q2; sxdg q2; ccx q3,q0,q4; u(0.14945495214773638,2.81914921032445,5.762037675418347) q0; rzx(0.011432953277890496) q1,q4; csx q0,q4; s q1; sdg q3; rz(1.287536000008686) q3; }
qreg q[5];
creg c[3];
cx q[2],q[0];
gate_P36 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
