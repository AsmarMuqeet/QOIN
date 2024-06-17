OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.119938110976439) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
gate gate_P179 q0,q1,q2,q3,q4 { ryy(5.119938110976439) q0,q2; cx q2,q0; cz q0,q2; u(4.2821251082408365,4.12851035826387,1.256958571175907) q3; y q3; rzz(4.914796133452752) q4,q1; sdg q1; z q1; rz(3.6425912047465503) q4; cry(3.795754299787651) q3,q4; }
qreg q[5];
creg c[3];
ccx q[2],q[0],q[4];
gate_P179 q[0],q[1],q[2],q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
