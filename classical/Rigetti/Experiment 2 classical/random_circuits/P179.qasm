OPENQASM 2.0;
include "qelib1.inc";
gate ryy(param0) q0,q1 { rx(pi/2) q0; rx(pi/2) q1; cx q0,q1; rz(5.119938110976439) q1; cx q0,q1; rx(-pi/2) q0; rx(-pi/2) q1; }
qreg q[5];
creg c[3];
ryy(5.119938110976439) q[0],q[2];
cx q[2],q[0];
cz q[0],q[2];
u(4.2821251082408365,4.12851035826387,1.256958571175907) q[3];
y q[3];
rzz(4.914796133452752) q[4],q[1];
sdg q[1];
z q[1];
rz(3.6425912047465503) q[4];
cry(3.795754299787651) q[3],q[4];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
