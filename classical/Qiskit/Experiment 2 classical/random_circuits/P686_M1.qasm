OPENQASM 2.0;
include "qelib1.inc";
gate gate_P686 q0,q1,q2,q3,q4 { p(2.84378215685773) q0; t q0; rz(0.3392442108356544) q0; cx q1,q2; sdg q2; x q2; u(4.331405931234827,4.349492950557991,0.7502467712662141) q3; id q3; rz(5.115435062988868) q4; csx q4,q1; cz q3,q1; sxdg q4; }
qreg q[5];
creg c[3];
ccx q[1],q[0],q[3];
gate_P686 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
